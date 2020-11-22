local game = require 'Common/game';

--const
local mapId = 2018040;
local startPartyDialogId = 11077302;

--UI Objects
local bgContainer;
local furnitureList;
local houseEvtUtil;
local editPanel;
local bottom;
local houseUIContainer;
local houseContentScope;
local furnitureProcessText;
local ninjaProcessText;
local partyButton;
local partyRewardRedDot;
local receivedTag;
local backButton;
local showUIButton;
local hideUIButton;
local switchUIArea;
local uiContent;

--variables
local activityId;
local activityData;
local taskChapter;
local taskSection;
local dragingObject;
local dragingObjectMouseOffset;
local dragingObjectOriginalPos;
local dragingObjectSeq;
local dragingFromStorageSeq;
local camera;
local bagFurnitures;
local arrangedFurnitures;
local mapResCache;
local worldModel;
local closeAfterSave = false;
local closeFailed = false;
local reEnterHouseAfterClose = false;
local haveLoadDifferentMapRes = false;
local currentSelectedItemSeq;
local minPositionX;
local maxPositionX;
local minPositionY;
local maxPositionY;

function awake()
    local i;

    bgContainer = bgContainerObj;
    furnitureList = game.getComponent(furnitureListObj, "MaouStaticList");
    houseEvtUtil = game.getComponent(houseContentObj, "EvtUtil");
    editPanel = game.getComponent(editPanelObj, "LuaBehaviour");
    houseUIContainer = houseUIContainerObj;
    houseContentScope = houseContentScopeObj;
    furnitureProcessText = game.getComponent(furnitureProcessTextObj, CS.UnityEngine.UI.Text);
    ninjaProcessText = game.getComponent(ninjaProcessTextObj, CS.UnityEngine.UI.Text);
    partyButton = game.getComponent(partyButtonObj, "MaouButton");
    partyRewardRedDot = partyRewardRedDotObj;
    receivedTag = receivedTagObj;
    bottom = bottomObj;
    backButton = game.getComponent(backButtonObj, "MaouButton");
    showUIButton = game.getComponent(showUIButtonObj, "MaouButton");
    hideUIButton = game.getComponent(hideUIButtonObj, "MaouButton");
    switchUIArea = switchUIAreaObj;
    uiContent = uiContentObj;
    
    houseEvtUtil:OnPointerClickEvent("+", onHousePointerClickEvent);
    houseEvtUtil:OnBeginDragEvent("+", onHouseBeginDragEvent);
    houseEvtUtil:OnDragEvent("+", onHouseDragEvent);
    houseEvtUtil:OnEndDragEvent("+", onHouseEndDragEvent);
    partyButton.onClick:AddListener(onPartyButtonClicked);
    backButton.onClick:AddListener(onBackButtonClicked);
    showUIButton.onClick:AddListener(onShowUIButtonClicked);
    hideUIButton.onClick:AddListener(onHideUIButtonClicked);

    dragingObject = nil;
    mapResCache = game.cache("MapResCache");
    worldModel = game.model("WorldModel");

    game.active(partyButton, false);
    game.active(receivedTag, false);
    game.active(partyRewardRedDot, false);
    game.active(hideUIButton, true);
    game.active(showUIButton, false);
    furnitureProcessText.text = "";
    ninjaProcessText.text = "";
end

function initData(params)
    activityId = params[0];
end

function onShow()
    camera = game.getParentComponent(self.gameObject, CS.UnityEngine.Camera);
    requestData(1);
end

function requestData(operateType, itemSeq, itemId, itemPos, chapterId, sectionId)
    local request;

    request = {};
    request.comm = game.getCommActivityReq(activityId, operateType);
    if (itemSeq ~= nil) then
        request.seq_id = itemSeq;
    end
    if (itemId ~= nil) then
        request.item_id = itemId;
    end
    if (itemPos ~= nil) then
        request.pos = itemPos;
    end
    if (operateType == 2) then
        request.get_task_reward = {};
        request.get_task_reward.chapter_id = chapterId;
        request.get_task_reward.section_id = sectionId;
    end

    game.luaSend("Activity200211", request, onDataResponse, true);
end

function onDataResponse(req, rsp, eCode)
    local lastAddItem;
    local diffItem;
    local newArrangedFurnitures;
    
    if (game.isNull(self)) then
        return;
    end

    if (eCode ~= 0) then
        game.showCodeTip(eCode);
        if (req.comm.operate_type == 1) then
            game.closeSelf(self);
        elseif (req.comm.operate_type == 100 or req.comm.operate_type == 101 or req.comm.operate_type == 102) then
            requestData(1);
        end

        return;
    end

    activityData = rsp;

    if (req.comm.operate_type == 1) then
        arrangedFurnitures = convertArrangedFurnitures(rsp.pos_info);
        bagFurnitures = convertBagFurnitures(rsp.task.chapter_list[1].section_list, rsp.pos_info);
        editPanel:CallLuaFunction("init", arrangedFurnitures, bagFurnitures, dragFurnitureFromStorageCallback);
        updateMap();
        updateFurnitures();
    elseif (req.comm.operate_type == 2) then
        if (rsp.get_reward ~= nil) then
            game.showPopAward(rsp.get_reward);
        end
    elseif (req.comm.operate_type == 100) then
        lastAddItem = findFurnitureBySeq(arrangedFurnitures, -1);
        if (lastAddItem ~= nil) then
            newArrangedFurnitures = convertArrangedFurnitures(rsp.pos_info);
            diffItem = getDiffFurnitureBySeq(arrangedFurnitures, newArrangedFurnitures);
            if (diffItem ~= nil) then
                lastAddItem.pos_info.seq = diffItem.pos_info.seq;
            else
                requestData(1);
            end
        else
            requestData(1);
        end
    end

    updateProcess();
end

function updateProcess()
    local furnitureNum;
    local ninjaNum;
    local tempArrangedFurniture;

    if (arrangedFurnitures ~= nil and activityData ~= nil) then
        furnitureNum = 0;
        ninjaNum = 0;
        for i = 1,#arrangedFurnitures do
            tempArrangedFurniture = arrangedFurnitures[i];
            if (tempArrangedFurniture.type == 1) then
                furnitureNum = furnitureNum + 1;
            else
                ninjaNum = ninjaNum + 1;
            end
        end

        furnitureProcessText.text = CS.System.String.Format("已摆放装饰：{0}/{1}", furnitureNum, activityData.item_num);
        ninjaProcessText.text = CS.System.String.Format("已入场忍者：{0}/{1}", ninjaNum, activityData.ninja_num);

        if (activityData.task ~= nil and activityData.task.chapter_list ~= nil and #activityData.task.chapter_list >= 2 and activityData.task.chapter_list[2].section_list ~= nil and #activityData.task.chapter_list[2].section_list >= 1) then
            taskChapter = activityData.task.chapter_list[2];
            taskSection = taskChapter.section_list[1];
            if (taskSection.status == 0) then --未完成
                game.active(partyButton, true);
                game.active(receivedTag, false);
                game.active(partyRewardRedDot, false);
            elseif (taskSection.status == 1) then --已完成
                game.active(partyButton, true);
                game.active(receivedTag, false);
                game.active(partyRewardRedDot, true);
            elseif (taskSection.status == 2) then --已领取
                game.active(partyButton, false);
                game.active(receivedTag, true);
                game.active(partyRewardRedDot, false);
            else
                game.active(partyButton, false);
                game.active(receivedTag, false);
                game.active(partyRewardRedDot, false);
            end
        end
    end
end

function convertArrangedFurnitures(originalList)
    local result;
    local tempFurniture;
    local listFurniture;

    if (originalList ~= nil) then
        result = {};
        for i = 1,#originalList do
            listFurniture = originalList[i];
            if (listFurniture.pos_info ~= nil and #listFurniture.pos_info > 0) then
                for j = 1,#listFurniture.pos_info do
                    tempFurniture = {};
                    tempFurniture.id = listFurniture.id;
                    tempFurniture.type = listFurniture.type;
                    tempFurniture.pos_info = {};
                    tempFurniture.pos_info.seq = listFurniture.pos_info[j].seq;
                    tempFurniture.pos_info.pos = listFurniture.pos_info[j].pos;
                    table.insert(result, tempFurniture);
                end
            end
        end
    end

    return result;
end

function convertBagFurnitures(serverBagFurnitures, serverArrangedFurnitures)
    local result;
    local listBagFurniture;
    local itemId;
    local itemType;
    local foundServerArrangedFurniture;

    if (serverBagFurnitures ~= nil) then
        result = {};
        for i = 1,#serverBagFurnitures do
            listBagFurniture = serverBagFurnitures[i];
            tempBagFurniture = {};
            tempBagFurniture.cur_value = listBagFurniture.cur_value;
            tempBagFurniture.status = listBagFurniture.status;
            if (listBagFurniture.str_arg_list_data ~= nil) then
                tempBagFurniture.str_arg_list_data = {};
                for j = 1,#listBagFurniture.str_arg_list_data do
                    table.insert(tempBagFurniture.str_arg_list_data, listBagFurniture.str_arg_list_data[j]);
                end
                itemId = tonumber(tempBagFurniture.str_arg_list_data[1]);
                itemType = tonumber(tempBagFurniture.str_arg_list_data[2]);
                if (itemType == 1) then
                    foundServerArrangedFurniture = findFurnitureById(serverArrangedFurnitures, itemId);
                    if (foundServerArrangedFurniture ~= nil and foundServerArrangedFurniture.pos_info ~= nil) then
                        tempBagFurniture.cur_value = tempBagFurniture.cur_value + #foundServerArrangedFurniture.pos_info;
                    end
                elseif (itemType == 2) then
                    if (listBagFurniture.status == 0) then
                        tempBagFurniture.cur_value = 0;
                    elseif (listBagFurniture.status == 2) then
                        tempBagFurniture.cur_value = 1;
                    end
                else
                    tempBagFurniture.cur_value = 0;
                end
            end
            table.insert(result, tempBagFurniture);
        end
    end

    return result;
end

function findFurnitureBySeq(furnitures, seq)
    local tempFurniture;

    if (furnitures ~= nil) then
        for i = 1,#furnitures do
            tempFurniture = furnitures[i];
            if (tempFurniture.pos_info.seq == seq) then
                return tempFurniture;
            end
        end
    end

    return nil;
end

function findFurnitureById(furnitures, id)
    local tempFurniture;

    if (furnitures ~= nil and id ~= nil) then
        for i = 1,#furnitures do
            tempFurniture = furnitures[i];
            if (tempFurniture.id == id) then
                return tempFurniture;
            end
        end
    end

    return nil;
end

function getDiffFurnitureBySeq(oldFurnitures, newFurnitures)
    local tempFurniture;
    local foundFurniture;

    if (newFurnitures ~= nil) then
        for i = 1,#newFurnitures do
            tempFurniture = newFurnitures[i];
            foundFurniture = findFurnitureBySeq(oldFurnitures, tempFurniture.pos_info.seq);
            if (foundFurniture == nil) then
                return tempFurniture;
            end
        end
    end

    return nil;
end

function updateFurnitures()
    local i;
    local tempFurniture;
    local tempArrangedFurniture;

    furnitureList:SetItems(#arrangedFurnitures);
    for i = 1,#arrangedFurnitures do
        tempArrangedFurniture = arrangedFurnitures[i];
        tempFurniture = furnitureList:GetItem(i-1);
        game.callLuaFunction(tempFurniture, "setData", tempArrangedFurniture, houseUIContainer, onItemSelectedCallback, onItemStoreCallback, onItemBeginDragEvent, onItemDragEvent, onItemEndDragEvent);
    end
    updateFurnitureSelectedStatus();
end

function addFurnitureToHouse(furniture)
    local pos = nil;
    local furnitureObj;
    local count;

    count = #arrangedFurnitures;
    table.insert(arrangedFurnitures, furniture);

    furnitureList:SetItems(count+1);
    furnitureObj = furnitureList:GetItem(count);
    game.callLuaFunction(furnitureObj, "setData", furniture, houseUIContainer, onItemSelectedCallback, onItemStoreCallback, onItemBeginDragEvent, onItemDragEvent, onItemEndDragEvent);
    return furnitureObj;
end

function dragFurnitureFromStorageCallback(pObj, pFurniture, pEventData)
    local furnitureEditItemObj;
    local tempFurniture = {};
    local tempPos = getDragMousePosition(furnitureListObj.transform, camera);

    tempFurniture.id = pFurniture.id;
    tempFurniture.type = pFurniture.type;
    tempFurniture.pos_info = {};
    tempFurniture.pos_info.seq = -1;
    tempFurniture.pos_info.pos = convertVector2ToProtoPoint(tempPos);
    furnitureEditItemObj = addFurnitureToHouse(tempFurniture);
    if (pFurniture.num > 1) then
        pFurniture.num = pFurniture.num - 1;
        game.callLuaFunction(pObj, "updateView");
    else
        editPanel:CallLuaFunction("updateArrangedFurnitures", arrangedFurnitures);
    end
    game.active(uiContent, false);
    dragingFromStorageSeq = tempFurniture.seq;
    pEventData.pointerDrag = furnitureEditItemObj;
    CS.EvtUtil.ExecuteBeginDragEvent(furnitureEditItemObj, pEventData);
end

function getNextFurnitureSeq()
    local tempSeq;
    local exist;
    
    if (arrangedFurnitures == nil or #arrangedFurnitures == 0) then
        return 1;
    end

    for tempSeq = 1,#arrangedFurnitures+1 do
        exist = false;
        for i = 1,#arrangedFurnitures do
            if (arrangedFurnitures[i].seq == tempSeq) then
                exist = true;
                break;
            end
        end
        if (exist == false) then
            return tempSeq;
        end
    end

    return 0;
end

function onItemSelectedCallback(itemData)
    if (itemData == nil) then
        currentSelectedItemSeq = nil;
    else
        currentSelectedItemSeq = itemData.pos_info.seq;
    end
    updateFurnitureSelectedStatus();
end

function onItemStoreCallback(pObj, pItemData)
    for i = 1,#arrangedFurnitures do
        if (arrangedFurnitures[i].pos_info.seq == pItemData.pos_info.seq) then
            table.remove(arrangedFurnitures, i);
            break;
        end
    end

    currentSelectedItemSeq = nil;
    game.callLuaFunction(pObj, "setSelected", currentSelectedItemSeq);
    updateFurnitures();
    editPanel:CallLuaFunction("updateArrangedFurnitures", arrangedFurnitures);

    requestData(101, pItemData.pos_info.seq, pItemData.id, pItemData.pos_info.pos);
end

function updateFurnitureSelectedStatus()
    local tempFurniture;
    for i = 1,furnitureList.num do
        tempFurniture = furnitureList:GetItem(i-1);
        game.callLuaFunction(tempFurniture, "setSelected", currentSelectedItemSeq);
    end
end

function onItemBeginDragEvent(obj, eventData)
    local mousePosition;
    local itemData;

    if (dragingObject == nil) then
        dragingObject = obj;
        mousePosition = getDragMousePosition(obj.transform.parent.transform, camera);
        dragingObjectMouseOffset = CS.UnityEngine.Vector2(obj.transform.anchoredPosition.x - mousePosition.x, obj.transform.anchoredPosition.y - mousePosition.y);
        itemData = game.callLuaFunction(obj, "getData");
        dragingObjectOriginalPos = obj.transform.anchoredPosition;
        dragingObjectSeq = itemData.seq;
        onItemSelectedCallback(itemData);
        game.active(uiContent, false);
    end
end

function onItemDragEvent(obj, eventData, itemData)
    local mousePosition;
    local objPosition;

    if (obj == dragingObject) then
        mousePosition = getDragMousePosition(obj.transform.parent.transform, camera);
        objPosition = CS.UnityEngine.Vector2(mousePosition.x + dragingObjectMouseOffset.x, mousePosition.y + dragingObjectMouseOffset.y);
        obj.transform.anchoredPosition = objPosition;
        itemData.pos_info.pos = convertVector2ToProtoPoint(objPosition);
    end
end

function onItemEndDragEvent(obj, eventData, itemData)

    if (obj == dragingObject) then
        dragingObject = nil;
        dragingObjectSeq = nil;
        dragingObjectMouseOffset = nil;
        itemData.pos_info.pos = convertVector2ToProtoPoint(obj.transform.anchoredPosition);
        CS.UnityEngine.Debug.LogFormat("[lua][onItemEndDragEvent]seq = {2}, pos = ({0}, {1})", itemData.pos_info.pos.x, itemData.pos_info.pos.y, itemData.pos_info.seq);
        game.active(uiContent, true);
        dragingObjectOriginalPos = nil;
        dragingFromStorageSeq = nil;

        if (itemData.pos_info.seq == -1) then
            requestData(100, -1, itemData.id, itemData.pos_info.pos);
        else
            requestData(102, itemData.pos_info.seq, itemData.id, itemData.pos_info.pos);
        end
    end
end

function getDragMousePosition(parentRT, cam)
    local position = CS.UnityEngine.Vector2.zero;
    local success;
    local mousePosition;

    mousePosition = CS.UnityEngine.Vector2(CS.UnityEngine.Input.mousePosition.x, CS.UnityEngine.Input.mousePosition.y);
    success, position = CS.UnityEngine.RectTransformUtility.ScreenPointToLocalPointInRectangle(parentRT, mousePosition, cam);
    return position;
end

function updateMap()
    mapResCache:LoadMap(mapId, onMapLoaded);
end

function onMapLoaded(prefab)
    local i;
    local prefabImgObj;
    local prefabImg;
    local prefabBackground;
    local tempImgObj;
    local tempImg;
    local success;
    local errorStr;
    local mapComponent;
    
    CS.UnityEngine.Debug.Log("[NinjaHouseEditView]onMapLoaded");
    prefabBackground = prefab.transform:Find("Background");
    for i = 1,prefabBackground.childCount do
        prefabImgObj = prefabBackground:GetChild(i-1).gameObject;
        prefabImg = game.getComponent(prefabImgObj, CS.UnityEngine.SpriteRenderer);
        if (i <= bgContainer.transform.childCount) then
            tempImgObj = bgContainer.transform:GetChild(i-1).gameObject;
            tempImgObj.name = prefabImgObj.name;
        else
            tempImgObj = CS.UnityEngine.GameObject(prefabImgObj.name, typeof(CS.UnityEngine.RectTransform), typeof(CS.UnityEngine.UI.Image));
            tempImgObj.transform:SetParent(bgContainer.transform);
            tempImgObj.transform.localScale = CS.UnityEngine.Vector3.one;
        end
        game.active(tempImgObj, true);
        tempImgObj.transform.anchoredPosition = CS.UnityEngine.Vector2(100 * prefabImgObj.transform.localPosition.x, 100 * prefabImgObj.transform.localPosition.y);
        tempImg = game.getComponent(tempImgObj, CS.UnityEngine.UI.Image);
        tempImg.sprite = prefabImg.sprite;
        tempImg:SetNativeSize();
    end

    if (bgContainer.transform.childCount > prefabBackground.childCount) then
        for i = prefabBackground.childCount+1,bgContainer.transform.childCount do
            tempImgObj = bgContainer.transform:GetChild(i-1).gameObject;
            game.active(tempImgObj, false);
        end
    end

    mapComponent = game.getComponent(prefab, "Map");
    calValidPosition(mapComponent);
end

function calValidPosition(map)
    if (map == nil) then
        minPositionX = 0;
        maxPositionX = 0;
        minPositionY = 0;
        maxPositionY = 0;
        return;
    end

    CS.UnityEngine.Debug.LogFormat("houseContentScope.transform.sizeDelta.x: {0}", houseContentScope.transform.sizeDelta.x);
    CS.UnityEngine.Debug.LogFormat("houseContentScope.transform.sizeDelta.y: {0}", houseContentScope.transform.sizeDelta.y);

    minPositionX = -map.width / 2 + houseContentScope.transform.rect.width / 2;
    maxPositionX = map.width / 2 - houseContentScope.transform.rect.width / 2;
    
    if (minPositionX > maxPositionX) then
        minPositionX = 0;
        maxPositionX = 0;
    end

    --包含4:3的处理
    minPositionY = -map.height / 2 + houseContentScope.transform.rect.height / 2;
    maxPositionY = map.height / 2 - houseContentScope.transform.rect.height / 2;

    if (minPositionY > maxPositionY) then
        minPositionY = 0;
        maxPositionY = 0;
    end
end

function onHousePointerClickEvent(obj, eventData)
    onItemSelectedCallback(nil);
end

function onHouseBeginDragEvent(obj, eventData)
    local mousePosition;
    if (dragingObject == nil) then
        dragingObject = obj;
        mousePosition = getDragMousePosition(obj.transform.parent.transform, camera);
        dragingObjectMouseOffset = CS.UnityEngine.Vector2(obj.transform.anchoredPosition.x - mousePosition.x, obj.transform.anchoredPosition.y - mousePosition.y);
        game.active(uiContent, false);
        game.active(houseUIContainer, false);
    end
end

function onHouseDragEvent(obj, eventData)
    local mousePosition;
    local objPosition;

    if (obj == dragingObject) then
        mousePosition = getDragMousePosition(obj.transform.parent.transform, camera);
        objPosition = CS.UnityEngine.Vector2(mousePosition.x + dragingObjectMouseOffset.x, mousePosition.y + dragingObjectMouseOffset.y);
        objPosition.x = math.min(objPosition.x, maxPositionX);
        objPosition.x = math.max(objPosition.x, minPositionX);
        objPosition.y = math.min(objPosition.y, maxPositionY);
        objPosition.y = math.max(objPosition.y, minPositionY);
        obj.transform.anchoredPosition = objPosition;
    end
end

function onHouseEndDragEvent(obj, eventData)
    if (obj == dragingObject) then
        dragingObject = nil;
        dragingObjectMouseOffset = nil;
        dragingObjectOriginalPos = nil;
        dragingObjectSeq = nil;
        dragingFromStorageSeq = nil;
        game.active(uiContent, true);
        game.active(houseUIContainer, true);
    end
end

function onHide()
    game.model("WorldModel").forceChangeMap = true;
    game.call(CS.EnterDefaultMapCommand());
end


function onPartyButtonClicked()
    if (taskSection ~= nil) then
        if (taskSection.status == 0) then
            game.showTip("条件尚未满足");
        else
            game.call(CS.ShowTaskNpcDialogCommand(startPartyDialogId));
        end
    end
end

function getPartyReward()
    if (taskChapter ~= nil and taskSection ~= nil and taskSection.status == 1) then
        requestData(2, nil, nil, nil, taskChapter.chapter_id, taskSection.section_id);
    end
end

function onBackButtonClicked()
    game.closeSelf(self);
end

function convertVector2ToProtoPoint(point)
    local result = {};
    result.x = CS.UnityEngine.Mathf.RoundToInt(point.x * 100);
    result.y = CS.UnityEngine.Mathf.RoundToInt(point.y * 100);

    return result;
end

function onShowUIButtonClicked()
    game.active(showUIButton, false);
    game.active(hideUIButton, true);
    game.active(editPanel, true);
    game.active(bottom, true);
    game.active(backButton, true);
end

function onHideUIButtonClicked()
    game.active(showUIButton, true);
    game.active(hideUIButton, false);
    game.active(editPanel, false);
    game.active(bottom, false);
    game.active(backButton, false);
end

function onDestroy()
    houseEvtUtil:OnPointerClickEvent("-", onHousePointerClickEvent);
    houseEvtUtil:OnBeginDragEvent("-", onHouseBeginDragEvent);
    houseEvtUtil:OnDragEvent("-", onHouseDragEvent);
    houseEvtUtil:OnEndDragEvent("-", onHouseEndDragEvent);
    partyButton.onClick:RemoveListener(onPartyButtonClicked);
    backButton.onClick:RemoveListener(onBackButtonClicked);
    showUIButton.onClick:RemoveListener(onShowUIButtonClicked);
    hideUIButton.onClick:RemoveListener(onHideUIButtonClicked);
end