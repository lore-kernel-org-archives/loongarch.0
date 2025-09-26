Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5F2FFDDC
	for <loongarch@lists.linux.dev>; Fri, 26 Sep 2025 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758911232; cv=none; b=nx+MgqVsN8TFsDxgjWVWogbqLMozhtdyyvn66Ntwdept1fqeobUWnL8DVgeZtcyc+CbU0Hpd5x9NCDitAhvEdaNELZZpa9z0HddSrbmZkuJ3+5+kcbF3DyNypK17Qq52hcXXoNgdF/zrc9ggk8FF6owpHCimyjx1vNvZCCGb7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758911232; c=relaxed/simple;
	bh=vT0s+anZHp3vVXK8ycfd4nUKVAa/fOAxmeAj5MMGowA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtHtIS/D5UTNkIQi7LFcgaWZBsYohoXQep40EeOG/DMECBf7VzAOn4xMevIpfXFWTl0TLoLiLy3L6cI3ch2hfJiVpIcyP4HaVr1tAobIqdeNUNA0+Ks2xM1DKl2i0tZWln2PRRrsk5jqdRHGKVO7kn9mo8ZKBN06y87l3rAPNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVYRmHaX; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVYRmHaX"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b55197907d1so1914588a12.0
        for <loongarch@lists.linux.dev>; Fri, 26 Sep 2025 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758911230; x=1759516030; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+8ocQlmUMq9pXBq8UEwhrzIt6cTNzAIG55h0HBAM4YU=;
        b=WVYRmHaXfypQakD2AKeAH1X5w7x3nSy3kS5pmpw4Ae/BYxAqM0L11u7c4El9nz8Oct
         NhBQyTdYz7xUa/mXD8LyBMo0VWZUDpAtuDarZ921T3Y1AJgX18xuy6xcbWgZMgT9NLbQ
         1Ul+8nwonVKtvNMuo/LSanc3l9L1VmRyQSTV2wENWOljkAIgjyM2/Jj8mnlVV4mMU0vd
         1N48EXMl+gRv+TYErVXzmRqEq4j/TTEmGd7B98Y7+BNXvNTpX62ax9bCHPpaaOlLu3V0
         p4KZaOZQL9rjyX0dR3REhYOxXeN7DXlFVcBqooC8yyznjSlI/Rryou2b8RrSV4Df3a8S
         ICFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758911230; x=1759516030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8ocQlmUMq9pXBq8UEwhrzIt6cTNzAIG55h0HBAM4YU=;
        b=thi8gz6MkdYeufY5u6uY1bAtyn6RWoNXEC0IaPDF763u/iEjM6etItEQo7blPe+iSI
         Cc3v+dvHAUOK0oOtNmMaQFbP3ixjgZq6GTdlL/En010zbvdxRSk0i43e94n3xqpoaOxR
         bwSWrhie/G47TaxI0lHdfr+Ww3H1kL6qyWzInhmWH4aoL6BaHhdc80lT5Dj2wS2f7aDD
         7pxAUlP/PZC5gT4JMJ4c6sAxZnj5TuHjf4rtLVgvlnr+XesN3s+CcmkL9p8K1inhVbnE
         sdTYu5hzZUWFto3ZXn4WgA9+4QNC2PlyPQa5D1j2dOSv9h//wcjI8+8OOmxqMRwv5GZ3
         LJNg==
X-Forwarded-Encrypted: i=1; AJvYcCXP7kAPhnDVBUBRbeI6ERLEDJpBqH5dPY7BG/KbsIFlOiCQkXhVRVkny2UXLTY4qqH0sztaQplpnUY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvSI4Cwe8+qkc78p3Q3MTDAkUVksjYRTZRUU03kOW5VSF3nJzq
	njTm5t6TdfpqJ/uO3KWfpXSa/903ttDPkiNEbYESch1JeaVPc+0OroJo
X-Gm-Gg: ASbGncsyhq9cEkcFqxGawwismqgUbyS+E4NVbpaPGAm+6eILPQcBZet2SjfdT7dh3Pp
	Ajd1ZvY60vNfE99I+fSWBzDHzvn12w2/4aLdd4Qvt2+FO6LZnTKAwbBCoccmzVrePS/qQKzZy6V
	Rj1is/I0ZT5MB9kp/7EJc04VZUYqk/NxCdqNQ5SAVrpcOWqbvOWFEiFR8Vh5c1a796NcHtXPEre
	9KX3U0MgO1TiiRkwIlQcDf4feslJAuGd6YqerzGRtAOa7U3izTiz9SHYQpLR4OLsnyQO86ZI74V
	DrI6QA3swB+l3DLoZ5ZbDQnEjQGFj9lUIH9WEirEtNnNTSVrkzXjNQZ83qacnNcmI93cg1j7e6D
	B8KBWFmkEOJUVxULu3+dm0jsYZ9qoS6Qlb46h9aRs82tGQe/bUOgIkgEMRgvpymv2vaNcfw8=
X-Google-Smtp-Source: AGHT+IGebjuK7dOicE97vFXuy1UgxSVEpNqQoVcQsII2xv/PqxfHmBnI9VXibz+uzu4TEw8dcVIg5A==
X-Received: by 2002:a17:902:db09:b0:23f:f96d:7579 with SMTP id d9443c01a7336-27ed4aab6d7mr93613685ad.37.1758911229950;
        Fri, 26 Sep 2025 11:27:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821c8sm58890595ad.74.2025.09.26.11.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 11:27:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0104bccd-d3a2-4f6b-8838-0acf0563c4b6@roeck-us.net>
Date: Fri, 26 Sep 2025 11:27:08 -0700
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN
 enabled
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Binbin Zhou <zhoubinbin@loongson.cn>
References: <20250910091033.725716-1-chenhuacai@loongson.cn>
 <20250920234836.GA3857420@ax162>
 <CAAhV-H5S8VKKBkNyrWfeuCVv8jS6tNED6YNeAD=i-+wkaoRSDQ@mail.gmail.com>
 <899f2dec-e8b9-44f4-ab8d-001e160a2aed@roeck-us.net>
 <c1f9e36dbdff64298ed2c6418247fb37dcd1f986.camel@xry111.site>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <c1f9e36dbdff64298ed2c6418247fb37dcd1f986.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/26/25 10:15, Xi Ruoyao wrote:
> On Fri, 2025-09-26 at 07:31 -0700, Guenter Roeck wrote:
>> On Sun, Sep 21, 2025 at 09:07:38AM +0800, Huacai Chen wrote:
>>> Hi, Nathan,
>>>
>>> On Sun, Sep 21, 2025 at 7:48 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>>>
>>>> Hi Huacai,
>>>>
>>>> On Wed, Sep 10, 2025 at 05:10:33PM +0800, Huacai Chen wrote:
>>>>> ARCH_STRICT_ALIGN is used for hardware without UAL, now it only control
>>>>> the -mstrict-align flag. However, ACPI structures are packed by default
>>>>> so will cause unaligned accesses.
>>>>>
>>>>> To avoid this, define ACPI_MISALIGNMENT_NOT_SUPPORTED in asm/acenv.h to
>>>>> align ACPI structures if ARCH_STRICT_ALIGN enabled.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Reported-by: Binbin Zhou <zhoubinbin@loongson.cn>
>>>>> Suggested-by: Xi Ruoyao <xry111@xry111.site>
>>>>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>>>> ---
>>>>> V2: Modify asm/acenv.h instead of Makefile.
>>>>>
>>>>>   arch/loongarch/include/asm/acenv.h | 7 +++----
>>>>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/loongarch/include/asm/acenv.h b/arch/loongarch/include/asm/acenv.h
>>>>> index 52f298f7293b..483c955f2ae5 100644
>>>>> --- a/arch/loongarch/include/asm/acenv.h
>>>>> +++ b/arch/loongarch/include/asm/acenv.h
>>>>> @@ -10,9 +10,8 @@
>>>>>   #ifndef _ASM_LOONGARCH_ACENV_H
>>>>>   #define _ASM_LOONGARCH_ACENV_H
>>>>>
>>>>> -/*
>>>>> - * This header is required by ACPI core, but we have nothing to fill in
>>>>> - * right now. Will be updated later when needed.
>>>>> - */
>>>>> +#ifdef CONFIG_ARCH_STRICT_ALIGN
>>>>> +#define ACPI_MISALIGNMENT_NOT_SUPPORTED
>>>>> +#endif /* CONFIG_ARCH_STRICT_ALIGN */
>>>>>
>>>>>   #endif /* _ASM_LOONGARCH_ACENV_H */
>>>>
>>>> I am seeing several ACPI errors in my QEMU testing after this change in
>>>> Linus's tree as commit a9d13433fe17 ("LoongArch: Align ACPI structures
>>>> if ARCH_STRICT_ALIGN enabled").
>>>>
>>>>    $ make -skj"$(nproc)" ARCH=loongarch CROSS_COMPILE=loongarch64-linux- clean defconfig vmlinuz.efi
>>>>    kernel/sched/fair.o: warning: objtool: sched_update_scaling() falls through to next function init_entity_runnable_average()
>>>>    mm/mempolicy.o: warning: objtool: alloc_pages_bulk_mempolicy_noprof+0x380: stack state mismatch: reg1[30]=-1+0 reg2[30]=-2-80
>>>>    lib/crypto/mpi/mpih-div.o: warning: objtool: mpihelp_divrem+0x2d0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16
>>>>    In file included from include/acpi/acpi.h:24,
>>>>                     from drivers/acpi/acpica/tbprint.c:10:
>>>>    drivers/acpi/acpica/tbprint.c: In function 'acpi_tb_print_table_header':
>>>>    include/acpi/actypes.h:530:43: warning: 'strncmp' argument 1 declared attribute 'nonstring' is smaller than the specified bound 8 [-Wstringop-overread]
>>>>      530 | #define ACPI_VALIDATE_RSDP_SIG(a)       (!strncmp (ACPI_CAST_PTR (char, (a)), ACPI_SIG_RSDP, (sizeof(a) < 8) ? ACPI_NAMESEG_SIZE : 8))
>>>>          |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>    drivers/acpi/acpica/tbprint.c:105:20: note: in expansion of macro 'ACPI_VALIDATE_RSDP_SIG'
>>>>      105 |         } else if (ACPI_VALIDATE_RSDP_SIG(ACPI_CAST_PTR(struct acpi_table_rsdp,
>>>>          |                    ^~~~~~~~~~~~~~~~~~~~~~
>>>>    In file included from include/acpi/acpi.h:26:
>>>>    include/acpi/actbl.h:69:14: note: argument 'signature' declared here
>>>>       69 |         char signature[ACPI_NAMESEG_SIZE] ACPI_NONSTRING;       /* ASCII table signature */
>>>>          |              ^~~~~~~~~
>>>>  From this link this seems a comiler issue (at least not an
>>> arch-specific kernel issue):
>>> https://github.com/AOSC-Tracking/linux/commit/1e9ee413357ef58dd902f6ec55013d2a2f2043eb
>>>
>>
>> I see that the patch made it into the upstream kernel, now breaking both
>> mainline and 6.16.y test builds of loongarch64:allmodconfig with gcc.
>>
>> Since this is apparently intentional, I'll stop build testing
>> loongarch64:allmodconfig. So far it looks like my qemu tests
>> are not affected, so I'll continue testing those for the time being.
> 
> See https://gcc.gnu.org/PR122073 and
> https://github.com/acpica/acpica/pull/1050.
> 

I understand that. Every compiler has bugs. Normally workarounds are implemented.
Since that won't happen here, my remedy is to stop testing the affected
configuration(s). I do this whenever I learn that a known problem won't be fixed.
The above is not a complaint, just an information.

Guenter

