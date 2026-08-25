Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF3B38B7D4
	for <loongarch@lists.linux.dev>; Tue, 25 Aug 2026 05:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634844; cv=none; b=AymHqYOdTe2AEB6VHIKzJXsc1rvHpjRmckPqmgP3tSRL/rHbMg9Ju2I6RrTBTxWn+rPzEgCwViY+MhVcE3iLgZiuvuI/J64vZhDqi0zC3DyAviBTi7/uGQbDIJNyS+zzJYpphbUqli1HLDEWDZXBKpdDDFDxVVjqS/23MKML0/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634844; c=relaxed/simple;
	bh=Ugk3ZMPennCjMotYNWrJ5i3DkacCbwKqfslaRuIOipU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1MpvBooJ9Gf4Qtl8M9Xn9ZTJqF4wEolU09Kn1mDENPSgdVBCBPDXW1xQ8RFgLaEB0QBUvyjUNRa2zixQX6HgXhZXB0RYFUm6mlcdwcrRskWQh2fRa8WJOKX7nDzhjyCssYoFnUkNwRKZXWdxTqEctpGXyqgc44r5g5tFUDvLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgZFROyU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgZFROyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787634842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
	b=UgZFROyUVvKymJ7Xd3kMy1Q4anPT99/wBuuFE68r01iA9VzHD0agv8ZdYWZUI5ZPeJ1SmY
	3fkw1HvyFoeywcBuCT1EFwusSm27PTvt756Dhuv9Mpqw3B62DYAz+bY3Et+NrgKN5QXPYu
	hYCO1c719KJzdKbEGzkBMbZEtuDIySk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-LQQYpngfMGCMNazX8GyjCA-1; Tue, 25 Aug 2026 01:13:59 -0400
X-MC-Unique: LQQYpngfMGCMNazX8GyjCA-1
X-Mimecast-MFC-AGG-ID: LQQYpngfMGCMNazX8GyjCA_1787634838
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so5577900a91.2
        for <loongarch@lists.linux.dev>; Mon, 24 Aug 2026 22:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634838; x=1788239638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9OwnSzTLO9oC5dFpcmND+TzPw2bMH6k9WMlDpSF/Bk=;
        b=PlCTBfOEpboBLy0KqkgIM7Vfcc3+sRTotFv95neHvsPt/qyYzMYN+8AP2KOtZ+l1/9
         KGAhScEFLHTj9Ad4PyGSFAzOUYyN1UeyMr4dyb6q3POkTmqzakftrvl0w69ksG2Herr1
         xOVgVDi6BEYD4YdSQ1pq5YxzT52CnWi/Q8U9rdYC0oiqR9jd3gw+xTWOaA2G1fd7hdiN
         BIvblkjZQKzqsrAE9tlEre31p/KinJEMAPPfADEGwBnnaSVwbD36cKOs06QRBHL5G2aS
         VwGdshzkTJ28D7id3Q8wUtIuN1nrHvTNOOIzmzEMlBUo9yW9UQDwbzLGPWLb6L66iHIh
         9R8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+VZGrsyW12fIpBW1gAULOOfGkexN0dz77kLm6euFDKYbn9kK70McejreHaDDNX6gzpv2BrfgZ+8Q=@lists.linux.dev
X-Gm-Message-State: AFuF++kGyXJPBIVHCiJR8uUJLGGoG1982ep2ua90qKAIMZYjKCrSiNJz
	pV9WvEmu4XvoXCwXmxYrM/5lePjoxLLfmG2xL6pvUN36WUjC1zAU7OgVSlm1mFI2xS553vkE1d3
	0ueVkv8k4A7uXc53GUFUWfLzsnTpMlE+vqTdzDtHou+QfJkwXmAlVHVH3b+5xOw==
X-Gm-Gg: AR+sD130HDpA99n6eLfcF9jDe5y0VWVLxU4SBcadyCGLi8ngbyClsgTh9lqbmNhjmmI
	0SSK64UuNcDOtumC26m2UuCe1i/w0g+dpDThqLEHfRmtN8Ysa/yaieCktPZ0MdiPNZ5JlFQvSVp
	3oTzuuP9qGx+jIF1JyDla0WXhvrmy2grR6iMl0DBG09TdOGQ36k1KIf6ggZpmDiFXSEYdEHs8Cb
	pMYrVX28B+uId8W0ozNnNtMM4I9LXlYLv7cL8MJhXMNb4kCL2sscTzBLdoZUjTafvNG8NcifBu6
	HuIBoUV1lDpM3TGkXITtdd6/4m4yfA+1EtoVpT26mBMOuuLMRLiobrMbRRGT3hfAwstp8w9kUqi
	W4sWVpPaY3ZiBv0WtGQ==
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668902a91.0.1787634837949;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:184f:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-3964603084fmr8668825a91.0.1787634837463;
        Mon, 24 Aug 2026 22:13:57 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645da08desm2156603a91.17.2026.08.24.22.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 22:13:56 -0700 (PDT)
Message-ID: <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
Date: Tue, 25 Aug 2026 10:43:48 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Bradley Morgan <include@grrlz.net>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aoxQFxuzZ1AHmM8d@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UAyPLrrgk-KUI4R6Q8fw37sc5XI4LFDzTe7u-p29ck4_1787634838
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Will,

On 24/08/26 7:37 pm, Will Deacon wrote:
> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
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
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>> ---
>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>  kernel/kexec_elf.c                | 4 ++--
>>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> Hmm, so after this patch, are there actually any implementations of .probe()
> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
> a quick look.
> 
> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
fails inside elf_read_phdrs(). This behavior was previously discussed in
the first patch of this series [1].

[1]
https://lore.kernel.org/all/0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com/#t


-- 
Regards,
Mukesh Pilaniya

