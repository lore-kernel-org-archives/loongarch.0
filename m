Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A815E90
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 03:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204826; cv=none; b=G38t7zWmo+VGzpgzWij7YGoI0wifkDuOvkVNBJMfGZhXUA1HXCEV3LQftUGns2v6NrEosla3ace6OYXcIFGVg2pEHufgGH9RZv3UWotze2JsNI9Tcn744SJTqNcHSd3AOs/x2NQiei4BMrJw6bBhAEXlsdml3r+YuM9julFSjx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204826; c=relaxed/simple;
	bh=8VrGQ9JWMNkp88ZcKoNJ4KjJ/o/N2ufL664ToLN8D2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFNURfSXXow9KkwV+JkWlR9QMsZNI1qkuvZf8cbLPEK76cfmEK+r6T32FCjmZNHNcL0Rb0r4UcuL0/6M7cfpeYra7LfiEtB+PXz/phGP1TTJkYzhi12erGN4kXy9y5l0ogS2xENg0qLyu9Cn4EhkQPDx/zEyd2V2CIHvcIluroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=fSfKbNU3; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="fSfKbNU3"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 4E7A82618F
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 03:06:56 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id ABA7D2004D;
	Mon, 21 Apr 2025 03:06:47 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id E142B40009;
	Mon, 21 Apr 2025 03:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1745204806; bh=8VrGQ9JWMNkp88ZcKoNJ4KjJ/o/N2ufL664ToLN8D2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fSfKbNU377shWWTaQfLLmuHjgVsApMJkBR2TYwEXouMv7FwXeKQeoYBob85NigQ/A
	 1sdv1EnYuYMA2XiMFDa8d2bQKrwMqyxXktKeY/AszaoEKitPEkA/KBLkNnLwKKGiQz
	 CZiATjUbqcnq5SkFskkiFxWx1xNUxkYL/3Dd/Mis=
Received: from [198.18.0.1] (unknown [203.175.14.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4A87940EAC;
	Mon, 21 Apr 2025 03:06:43 +0000 (UTC)
Message-ID: <380146c3-c960-4895-9bed-3a3f303a53d6@aosc.io>
Date: Mon, 21 Apr 2025 11:06:40 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] LoongArch: Add some annotations in archhelp
To: Huacai Chen <chenhuacai@kernel.org>, Youling Tang <youling.tang@linux.dev>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
References: <20250421020301.34185-1-youling.tang@linux.dev>
 <20250421020301.34185-3-youling.tang@linux.dev>
 <CAAhV-H6AkHULnNgL3YH1ni1J+e0R06CRD=saWcVE7i_+QegBOA@mail.gmail.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <CAAhV-H6AkHULnNgL3YH1ni1J+e0R06CRD=saWcVE7i_+QegBOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E142B40009
X-Rspamd-Server: nf1.mymailcheap.com
X-Spamd-Result: default: False [-2.08 / 10.00];
	BAYES_HAM(-1.98)[94.91%];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[tangyouling.kylinos.cn:server fail,youling.tang.linux.dev:server fail];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
X-Rspamd-Action: no action

Hi Huacai and Youling,

在 2025/4/21 10:59, Huacai Chen 写道:
> Hi, Youling,
> 
> On Mon, Apr 21, 2025 at 10:03 AM Youling Tang <youling.tang@linux.dev> wrote:
>>
>> From: Youling Tang <tangyouling@kylinos.cn>
>>
>> - Add annotations to the kernel image.
>> - Modify the annotations of insatll.
>>
>> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
>> ---
>>   arch/loongarch/Makefile | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
>> index 64bdb52ddf7c..5711fe0efa76 100644
>> --- a/arch/loongarch/Makefile
>> +++ b/arch/loongarch/Makefile
>> @@ -184,6 +184,11 @@ install:
>>          $(call cmd,install)
>>
>>   define archhelp
>> -       echo '  install              - install kernel into $(INSTALL_PATH)'
>> +       echo '  vmlinux.elf          - Uncompressed ELF kernel image (arch/loongarch/boot/vmlinux.elf)'
>> +       echo '  vmlinux.efi          - Uncompressed EFI kernel image (arch/loongarch/boot/vmlinux.efi)'
> Replace "Uncompressed" with "Normal"? Because you use "normal" in the 2nd patch.

My two cents would be to use "uncompressed."

"Normal" is purely subjective - unless we do expect all users to use 
vmlinux and not vmlinuz, in which case we would need to give extra 
explanation for how that is normal. AFAIK there is no such expectation 
for LoongArch.

Best Regards,
Mingcong Bai

> 
> Huacai
> 
>> +       echo '  vmlinuz.efi          - Compressed EFI kernel image (arch/loongarch/boot/vmlinuz.efi)'
>> +       echo '                         Default when CONFIG_EFI_ZBOOT=y'
>> +       echo '  install              - Install kernel using (your) ~/bin/$(INSTALLKERNEL) or (distribution)'
>> +       echo '                         /sbin/$(INSTALLKERNEL) or install.sh to $$(INSTALL_PATH)'
>>          echo
>>   endef
>> --
>> 2.38.1
>>
>>
> 

