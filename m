Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D7A42DFEC
	for <loongarch@lists.linux.dev>; Tue, 21 Jul 2026 06:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617119; cv=none; b=rOfYPxfKwRlCJsfPuHq9R2A9M6kn+7zmOQ76aByj4AUM/NXyZVzbJlYTQKoA+oXL0Nz1hHfqaVF+zUq1qE6D9hK4kPG1vhCMFa2PbC34u0yRAOp17Zfu1eipvSnU23+Gf86G0GxtqAdKXeHLJrG1+WmmyRlOu+hp1oxeepsuddU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617119; c=relaxed/simple;
	bh=RDZaK+Lzd5iwaNs9vEgh2GeYGQAGrBjfEneLGGzO53Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTmdBLgtcC9C4SDJ89q7NlfOa4KFnCKURkzAnHLqibsF3PIPGDmz3kt1hA/NOOZAmAua4oMgikLWni4MLiZPTS7LMy+uNzi4232/QNDU3y6+93extKKbNATUGcvY5gPMSoJ6w3+0uHTG4Fh5V74wnRBcMcEkVWjWgIjrP1XSYEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 940430e884d111f1aa26b74ffac11d73-20260721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:108dd908-c2af-4ecb-ab3f-71b4b8dcb484,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:108dd908-c2af-4ecb-ab3f-71b4b8dcb484,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:15988a5c14ecfe2d67b42daff9276fe0,BulkI
	D:260721112446C9QKUL7Y,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 940430e884d111f1aa26b74ffac11d73-20260721
X-User: wangxuewen@kylinos.cn
Received: from [192.168.109.138] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1949559300; Tue, 21 Jul 2026 14:58:29 +0800
Message-ID: <42e1304d-dc79-400b-b41b-98bc1280a8c9@kylinos.cn>
Date: Tue, 21 Jul 2026 14:58:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] LoongArch: pci: add NULL check for map_bus return
 value in loongson_gpu_fixup_dma_hang
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260721025536.1484464-1-wangxuewen@kylinos.cn>
 <CAAhV-H4QLa0Y8-MqUPV1cb1oG_kcNRhA06CiN7n_+ekxZVR=ew@mail.gmail.com>
From: Xuewen Wang <wangxuewen@kylinos.cn>
In-Reply-To: <CAAhV-H4QLa0Y8-MqUPV1cb1oG_kcNRhA06CiN7n_+ekxZVR=ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,Huacai,

You are right, I haven't hit this crash in practice -- it was from                                                                                                                                                                                                        reading the code, not an observed failure. I'll drop this patch.                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                
I didn't verify carefully enough whether the NULL path is actually                                                                                                                                                                                                         
reachable here. After re-reading the code and the manual, map_bus()                                                                                                                                                                                                        
won't return NULL in this fixup context, so the check is unnecessary.                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                
Sorry for the noise. 

Best regards,
Xuewen Wang

在 2026/7/21 11:24, Huacai Chen 写道:
> Hi, Xuewen,
> 
> On Tue, Jul 21, 2026 at 10:56 AM Xuewen Wang <wangxuewen@kylinos.cn> wrote:
>>
>> The map_bus() callback can return NULL when the target device does not
>> exist (e.g. non-existent device hidden by FLAG_DEV_HIDDEN, or device > 0
>> on internal bridges). All other callers in the kernel check the return
>> value, but loongson_gpu_fixup_dma_hang() uses it directly, leading to a
>> null pointer dereference via readw(base + PCI_DEVICE_ID).
>>
>> Add the missing NULL check to prevent the crash.
> Have you really met the crash? Or just in your brain?
> 
> If you understand PCI fixup, you can know that map_bus() cannot get an
> arbitrary input here. When the LS7A GPU exists, it is impossible that
> DC doesn't exist.
> 
> Huacai
> 
>>
>> Fixes: 95db0c9f526d ("LoongArch: Workaround LS2K/LS7A GPU DMA hang bug")
>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>> ---
>>  arch/loongarch/pci/pci.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/loongarch/pci/pci.c b/arch/loongarch/pci/pci.c
>> index f33c7ea1443d..3cd89b0224e3 100644
>> --- a/arch/loongarch/pci/pci.c
>> +++ b/arch/loongarch/pci/pci.c
>> @@ -115,6 +115,11 @@ static void loongson_gpu_fixup_dma_hang(struct pci_dev *pdev, bool on)
>>         static u32 crtc_status[CRTC_NUM_MAX] = { 0 };
>>
>>         base = pdev->bus->ops->map_bus(pdev->bus, pdev->devfn + 1, 0);
>> +       if (!base) {
>> +               pci_dbg(pdev, "cannot map config space for devfn %02x.%d\n",
>> +                       PCI_SLOT(pdev->devfn + 1), PCI_FUNC(pdev->devfn + 1));
>> +               return;
>> +       }
>>         device = readw(base + PCI_DEVICE_ID);
>>
>>         regbase = ioremap(readq(base + PCI_BASE_ADDRESS_0) & ~0xffull, SZ_64K);
>> --
>> 2.25.1
>>

