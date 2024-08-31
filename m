Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6E71758F
	for <loongarch@lists.linux.dev>; Sat, 31 Aug 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725090064; cv=none; b=ON2e66Urk9QFrDQSlsQYyXWGiIGuiIoBM1RabraKw/Sq3mA4a6wZMkZ/X05Zb5Tk70bJkyj9rsZG4SL8sVZjBrPykr5R+aARiQfuPbkREoQITrOgd1026zZrMNnoboA24jwEFWmbd7/l9CstN+w0t03eXJ7WPWU8Vdksaqy6cGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725090064; c=relaxed/simple;
	bh=u2TLDIVYn/ltoYIw/AoXlW3X+ya46JQbBlhZ5/T2BQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtK6P7AZTJzyeEgtCFRVTZjLgh/N80lE7xp0upQF8qBoJdZ/iTtyMFYI9Dz7XHTj6afYQG62nasCLYNa4BslkLZFH3M0dgkIHAvY1O+j5Yme7XV/rK42gvC7G+/DeoT2QkjuY0OsWNxh9g+USz/obs3+2cYot6KcXCklkl6Nbxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WQbeHUXs; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WQbeHUXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725090038;
	bh=titFpAFRFG6lSC5TNWm3vO0HJx8nVGVx12kXcfKUHUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WQbeHUXsVf1bbvgaEgD11OikP8iUeU/Nv8XLeDWAGa/R9cQvFuLvWjwGdSQdPOyZv
	 9J0YC0+4tO17R/WrI04Ct1vymGG2gB8jPMr0fIzHxaTeAk1ziksizIf2xfCimA7Q7I
	 FLmMJLk9kxr4OYv5YUsfN0SqSP8VQw8936GoR5vI=
X-QQ-mid: bizesmtpsz13t1725090023t31myz
X-QQ-Originating-IP: sNcB1n3vxgVmHjLmLNF0NJUB/d2IZqPIuDFnWQbqixE=
Received: from [10.20.53.89] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Aug 2024 15:40:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15338145670686491411
Message-ID: <95E05902A7743E7B+99bf08fd-c057-41a9-9250-d05e1e89d92f@uniontech.com>
Date: Sat, 31 Aug 2024 15:40:21 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Loongarch64: pci: fix memleak in pci_acpi_scan_root
To: Huacai Chen <chenhuacai@kernel.org>,
 Wentao Guan <guanwentao@uniontech.com>
Cc: henhuacai@kernel.org, kernel@xen0n.name, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240831052157.13532-1-guanwentao@uniontech.com>
 <CAAhV-H7GptUdpKScV1AuZZm7w-F5oUXHRmaT9BFCZV4HuQExJg@mail.gmail.com>
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <CAAhV-H7GptUdpKScV1AuZZm7w-F5oUXHRmaT9BFCZV4HuQExJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1


On 2024/8/31 15:18, Huacai Chen wrote:
> Hi, Wentao,
>
> On Sat, Aug 31, 2024 at 1:24 PM Wentao Guan <guanwentao@uniontech.com> wrote:
>> Add kfree(root_ops) in this case to avoid memleak root_ops,
>> leaks when pci_find_bus() != 0.
>> Also delay assign root_ops when used for making code read clean.
>> Found by code review
>>
>> Signed-off-by: Wangyuli <wangyuli@uniontech.com>
> This should be Yuli Wang <wangyuli@uniontech.com>

While I maintain a preference for the traditional Chinese naming order, 
not particularly like putting my Chinese name in the English surname order,

I acknowledge that flexibility in this matter is often necessary.

It is sufficient for everybody to be aware that both 'WangYuli' and 
'Yuli Wang' refer to me.

>> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
>> ---
>>   arch/loongarch/pci/acpi.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
>> index 3eb61b8cd5e3..7f3539f5fa23 100644
>> --- a/arch/loongarch/pci/acpi.c
>> +++ b/arch/loongarch/pci/acpi.c
>> @@ -219,17 +219,18 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
>>                  return NULL;
>>          }
>>
>> -       root_ops->release_info = acpi_release_root_info;
>> -       root_ops->prepare_resources = acpi_prepare_root_resources;
>> -       root_ops->pci_ops = (struct pci_ops *)&info->cfg->ops->pci_ops;
>> -
>>          bus = pci_find_bus(domain, busnum);
>>          if (bus) {
>>                  memcpy(bus->sysdata, info->cfg, sizeof(struct pci_config_window));
>>                  kfree(info);
>> +               kfree(root_ops);
> Add kfree() is fine, but move root_ops assignment is unnecessary.
>
> Huacai
>
>>          } else {
>>                  struct pci_bus *child;
>>
>> +               root_ops->release_info = acpi_release_root_info;
>> +               root_ops->prepare_resources = acpi_prepare_root_resources;
>> +               root_ops->pci_ops = (struct pci_ops *)&info->cfg->ops->pci_ops;
>> +
>>                  bus = acpi_pci_root_create(root, root_ops,
>>                                             &info->common, info->cfg);
>>                  if (!bus) {
>> --
>> 2.20.1
>>
>>
-- 
WangYuli

