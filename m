Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17E242BEA4
	for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694368; cv=none; b=dwJTqh8YLWUpMb9GlmBlfxLvNYCCxWJWu/4tou80V3o53ewv1y9mrgi/RSkMmwyYUwGQyC4KY/wGFslYNM4NToooYhQy0s1PT2953W2svVgOh23tSzEcSTqB8rBI1nwSCDPCFwfhkKIN4Mj5hr2TLapJD/+Mt/F5eUw+rQJfLto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694368; c=relaxed/simple;
	bh=YFZXXCTx4SOuXXY6Oz21P4RKwwP6/R0X0JZtRJSh9b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROb9TqF+FUT9HPzDO8vBMzDk1GoVzgaHUyeAwlrDyoE3N6WVB4GUm75PF3ZfWy7T8Yef79UTYv5Clhp6RlV8CH8h5f7NHZDEP+9Q60mlAEr0QknBaeRe7e6exB9KGF1uHdttNVQ2PhWL7jxq4VXDov4MsgSUwn3AWt4h/b6jB00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3jotJYd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3jotJYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786694365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F8O34Xc16ur4O9EtunTdCdf0boIbkU6LPLycJBfuzuA=;
	b=G3jotJYdazNeGimrTGOXprIwT0bdpCwrzQ+n/TP39NgKitpSKIkECHy3s+v2Z/ml/aXdZL
	qjyeVa0kEd/x5zYkFV73oKUAPWR22B4Knkn2MX8jJhVA7K8dI8owGLpzND7LnCJupGJhVM
	mNJ1kefJni/l0BjuIm9FL11r41v9F7k=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-1KmzYTzRNB28h1hFS61rjg-1; Fri, 14 Aug 2026 03:59:24 -0400
X-MC-Unique: 1KmzYTzRNB28h1hFS61rjg-1
X-Mimecast-MFC-AGG-ID: 1KmzYTzRNB28h1hFS61rjg_1786694363
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso785609b3a.0
        for <loongarch@lists.linux.dev>; Fri, 14 Aug 2026 00:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694363; x=1787299163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8O34Xc16ur4O9EtunTdCdf0boIbkU6LPLycJBfuzuA=;
        b=ZWz6dxPRtWufusrbkNljC0sQL3cPK94z+3XMJu+2naST9BeOyy7mCDQljtM1sd2dXd
         ywZ0sZg49GKZTR1tErSmWEjh1S9ZeV4P7cB3GYDhDwcwVX0/xh0ZlgTjKAtFPVJJW/GE
         bWM9U3hCmpZH2YIRvI2/E2xEVbvxBxCZ3WV2weslWPLaPIremK6Pw677cDeg8zUBUQ/i
         O1pC9woSSKN4HLlhKuTAMR7n13/KnxNnzlOE1yavxroYYG6NDzGV4R2eAl7EhXn4GbJt
         2Am97ynIHb/MqExmTUQrcIJb3PdYk6Zltmh3H0feAEF4BwiDeL3dT46u/EpmcdPMLi1j
         hZKg==
X-Forwarded-Encrypted: i=1; AHgh+RqDLhS28SvgMHXMjjPq+e5sJDps6nZgTa5FIMp3IZ9kDEwWqkrNUEQK+HCmJAw1O3MXprl7x8RYue0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVE2aCJOkevF6sGCyHc+tBevvwikDgI8HCv1uSm3Jc+bgBbBei
	6kcv0gi+vQyPWoeux7EJE6ll09nxOJP2MizX6GjmCu4pwvHedjXSAT0z9vLJ8NHzGXBypG2CoYe
	v8FBOVn7mjhm6jkgyeFBzhhAMzCRqzKarLFeOuYY+RAYu4uCu7G7wmv1BMYfiCg==
X-Gm-Gg: AR+sD11/R5OLONttyHoR7WOjlCSqdRJJC6YR8F1YNTMA7sLsYZCZ6jc/mMMMNc35CVO
	TpmMB0KmI4o0C2TzbGPnf1bmJw+a/XwjJrwVRoghpckAYjdxs4XIRlOD66+7j+M6o788dhO37yZ
	Nb7zPqPMTdYPmS5N6I8+2BeYYdoox81P8oteNU66sCpsc4oUngy3hp6rRq4w+y+qd/uxUqBsvKL
	CUvktUUIEIWRwY/82DNJ5U8cmj6J6UBtnRiticnbsK5lL2JJ0PMFirSWu/UezuWpTkQVaREV/Cj
	Q40deizlNnPHtjre1LWvF1q8UDxVnG45sCoZqMw8EtT4XUhpLGnjqoKBs3z57gYWIJDrEAxdQQE
	Ew+2WGt/BI1c0WyAJxw==
X-Received: by 2002:a05:6a00:2d98:b0:84a:646f:193 with SMTP id d2e1a72fcca58-84fdde42b9bmr3951014b3a.0.1786694363303;
        Fri, 14 Aug 2026 00:59:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d98:b0:84a:646f:193 with SMTP id d2e1a72fcca58-84fdde42b9bmr3950974b3a.0.1786694362810;
        Fri, 14 Aug 2026 00:59:22 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d249b26sm121142b3a.43.2026.08.14.00.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:59:22 -0700 (PDT)
Message-ID: <81cb568c-e65f-4359-9c6f-f994f910f2f1@redhat.com>
Date: Fri, 14 Aug 2026 13:29:15 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Philipp Rudo <prudo@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <20260813151350.6b511155@rotkaeppchen>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20260813151350.6b511155@rotkaeppchen>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uAhjm6rCv31Wqh2EecwRuHWFx7k3Wck6-3hOiCntFl0_1786694363
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Philipp,

On 13/08/26 6:43 pm, Philipp Rudo wrote:
> Hi Mukesh,
> 
> the patch looks good to me.
> 
> There is also a corresponding kexec-tools patch, which was accidentally
> opened as a Github PR (https://github.com/horms/kexec-tools/pull/12).
> It will be sent to kexec@lists.infradead.org shortly.
> 
> Thanks
> 
> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> 
The kexec-tools patch has now been posted to the mailing list.
It can be found here:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

> On Thu, 13 Aug 2026 12:36:29 +0530
> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
> 
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
>>
>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>> ---
>> branch: next-20260812
>> base commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
>> ---
>>   arch/arm64/kernel/kexec_image.c   | 4 ++--
>>   arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>   arch/riscv/kernel/kexec_image.c   | 4 ++--
>>   kernel/kexec_elf.c                | 4 ++--
>>   4 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
>> index b70f4df15a1a..101259874d44 100644
>> --- a/arch/arm64/kernel/kexec_image.c
>> +++ b/arch/arm64/kernel/kexec_image.c
>> @@ -25,10 +25,10 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   		(const struct arm64_image_header *)(kernel_buf);
>>   
>>   	if (!h || (kernel_len < sizeof(*h)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	if (memcmp(&h->magic, ARM64_IMAGE_MAGIC, sizeof(h->magic)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	return 0;
>>   }
>> diff --git a/arch/loongarch/kernel/kexec_efi.c b/arch/loongarch/kernel/kexec_efi.c
>> index 5ee78ebb1546..28a1d0420ba3 100644
>> --- a/arch/loongarch/kernel/kexec_efi.c
>> +++ b/arch/loongarch/kernel/kexec_efi.c
>> @@ -24,12 +24,12 @@ static int efi_kexec_probe(const char *kernel_buf, unsigned long kernel_len)
>>   
>>   	if (!h || (kernel_len < sizeof(*h))) {
>>   		kexec_dprintk("No LoongArch image header.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	if (!loongarch_header_check_dos_sig(h)) {
>>   		kexec_dprintk("No LoongArch PE image header.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return 0;
>> diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
>> index 51dc89259f16..963a25f5b55b 100644
>> --- a/arch/riscv/kernel/kexec_image.c
>> +++ b/arch/riscv/kernel/kexec_image.c
>> @@ -20,7 +20,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
>>   
>>   	if (!h || kernel_len < sizeof(*h))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	/* According to Documentation/arch/riscv/boot-image-header.rst,
>>   	 * use "magic2" field to check when version >= 0.2.
>> @@ -28,7 +28,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
>>   
>>   	if (h->version >= RISCV_HEADER_VERSION &&
>>   	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   
>>   	return 0;
>>   }
>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>> index 3a5c25b2adc9..89a444a00693 100644
>> --- a/kernel/kexec_elf.c
>> +++ b/kernel/kexec_elf.c
>> @@ -172,7 +172,7 @@ static int elf_read_ehdr(const char *buf, size_t len, struct elfhdr *ehdr)
>>   
>>   	default:
>>   		pr_debug("Unknown ELF class.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return elf_is_ehdr_sane(ehdr, len) ? 0 : -ENOEXEC;
>> @@ -236,7 +236,7 @@ static int elf_read_phdr(const char *buf, size_t len,
>>   
>>   	default:
>>   		pr_debug("Unknown ELF class.\n");
>> -		return -EINVAL;
>> +		return -ENOEXEC;
>>   	}
>>   
>>   	return elf_is_phdr_sane(phdr, len) ? 0 : -ENOEXEC;
>>
>> ---
>> base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
>> change-id: 20260813-mpilaniy-ffb0cc92c313
>>
>> Best regards,
>> --
>> Mukesh Pilaniya <mpilaniy@redhat.com>
>>
> 

