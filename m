Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9721E0B63
	for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 20:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197374; cv=none; b=cGWrBuhDVV1Q5wIjFsW/FONnZGexVenGj7Wv1N04bMqnbVr2yx6Uni1yvsRiS/iiEPzUF2WaIFCcNDecD4wSReebUq81ORb34E+6s7PZDocdfQi8QW3rD++n7m/UNfz73EOunEZbh8mZtoJnfQhzyO1a+pj/X2x+q1bJ0QAsO8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197374; c=relaxed/simple;
	bh=AORgYkSEpqScrRJBsDbxUjNY993eTA7X1chV49DsV3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFhTZiPKpvTix1EPx5kz362O5Rszmsd3MrEGw8fwIC7WeOIPsrn9tqjlN90BMPge0NUsqcjJmZJ1xardVthA6Z4pgG+rXHZW8y3tedJpL+Hj/O942PKEUJHT5ebkRrTVgtidnZU0FR56R/lEk5QAE1jUbXtwCi6FnbHmEy1R0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OEMmEsie; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OEMmEsie"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83ab00438acso33118339f.0
        for <loongarch@lists.linux.dev>; Thu, 17 Oct 2024 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729197367; x=1729802167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11ToTU7vsMi2SSsjzOsYplAbVYXVrOxGmHdlQUxuJOM=;
        b=OEMmEsienrMChOA53IjVjZrF7DL+RFlh41HjxkxFPPtnJ7zgBgDH+jtNVThyds5fpJ
         rlmQahrw5A6j0mXmsBTblGtY4KJuzlsa55tMRYZANwyj1yJ4J4SVxaeN/Bn/FETPab2e
         L9EMHmFQH92cNgfbpE06fkuqZwFtWCJ9b2Y1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197367; x=1729802167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11ToTU7vsMi2SSsjzOsYplAbVYXVrOxGmHdlQUxuJOM=;
        b=Wmb/67JZExbTy3w5ZoFXXBlIY1SrOi2+y/tmAZ2g4rQ9SuoV7XDWBquR5KhUYJwOMI
         9P/ghm5lv4nWvPXacLAQOhhqfGa9vpcmXo7ivAycB4PLzEs86IPTk3oVOhJiInFcqZSJ
         6y+88TmMdVW5ee86eyoJWYingD8tqv8rc7HzQVtmA59/Ki5UrgCPkuhELjPqbv+ze1cC
         jfUufBiJNeOC3VcC91ExkLLOvXyzsQnc/+kWgd3GANBuhA+rMOoFQW8qszrtHLealAyc
         zyJM04Attnc2hWRJX+7eGGbibVQXhaXEgtuJswOxMhKRwbA55tB/sVIAFe/aVAmfqY/+
         q74w==
X-Forwarded-Encrypted: i=1; AJvYcCUHA7UL9WVCQjmbNd3OLuijrUGxOR14F91IihSOYRmBMZcTX5HIPNa52edMfJzm0dS8ofYsr19tYjY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70l8JRSUB5sgKn2rA7Nh2Oxjp8OZB+UMr2PKuXAKiDSb3+R1t
	B2V5aaSi3bORV2S3B1D4muptHhWG4FJCrS6QAWA8st3Hp1xvBDULltu5Clb9e94=
X-Google-Smtp-Source: AGHT+IEWVBCgEov4mw1J/kJN0ZwoTJEWDfnh4NgHTLEZFUbsmenZRhqLbReeBnLs3cdVCJsyxaShVQ==
X-Received: by 2002:a05:6e02:1808:b0:3a3:dadc:12f7 with SMTP id e9e14a558f8ab-3a3e5294a27mr33585585ab.3.1729197367437;
        Thu, 17 Oct 2024 13:36:07 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc10b83e9dsm49449173.56.2024.10.17.13.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 13:36:07 -0700 (PDT)
Message-ID: <56133d31-c94c-4c4c-9ae4-86f06b463a7d@linuxfoundation.org>
Date: Thu, 17 Oct 2024 14:36:06 -0600
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] kunit: qemu_configs: add LoongArch config
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241014-kunit-loongarch-v1-0-1699b2ad6099@linutronix.de>
 <20241014-kunit-loongarch-v1-2-1699b2ad6099@linutronix.de>
 <878d5f26-ef05-44f4-93e8-01f66088c0cc@linuxfoundation.org>
 <3a49d3e2-2d76-458f-a0fd-fe52a413f376@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <3a49d3e2-2d76-458f-a0fd-fe52a413f376@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/24 14:31, Thomas Weißschuh wrote:
> Hi Shuah,
> 
> Oct 17, 2024 22:27:29 Shuah Khan <skhan@linuxfoundation.org>:
> 
>> On 10/14/24 05:36, Thomas Weißschuh wrote:
>>> Add a basic config to run kunit tests on LoongArch.
>>> This requires QEMU 9.1.0 or later for the necessary direct kernel boot
>>> support.
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> ---
>>>    tools/testing/kunit/qemu_configs/loongarch.py | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>> diff --git a/tools/testing/kunit/qemu_configs/loongarch.py b/tools/testing/kunit/qemu_configs/loongarch.py
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..e7bb7c07819677dfdefac012821a732555813cae
>>> --- /dev/null
>>> +++ b/tools/testing/kunit/qemu_configs/loongarch.py
>>
>> Missing SPDX-License-Identifier.
> 
> Tue others configs don't have one either.
> 
>>> @@ -0,0 +1,16 @@
>>> +from ..qemu_config import QemuArchParams
>>> +
>>> +QEMU_ARCH = QemuArchParams(linux_arch='loongarch',
>>> +              kconfig='''
>>> +CONFIG_EFI_STUB=n
>>> +CONFIG_PCI_HOST_GENERIC=y
>>> +CONFIG_SERIAL_8250=y
>>> +CONFIG_SERIAL_8250_CONSOLE=y
>>> +CONFIG_SERIAL_OF_PLATFORM=y
>>> +''',
>>> +              qemu_arch='loongarch64',
>>> +              kernel_path='arch/loongarch/boot/vmlinux.elf',
>>> +              kernel_command_line='console=ttyS0',
>>> +              extra_qemu_params=[
>>> +                      '-machine', 'virt',
>>> +                      '-cpu', 'max',])
>>>
>>
>> Please send v2 with all the reviewed by tags. If there
>> is a resend 3.4 and 4/4 in this series, send them.
> 
> I'll do that. But it will take some weeks, as I just went on vacation.
> 

Sounds good. Enjoy your vacation.

thanks,
-- Shuah



