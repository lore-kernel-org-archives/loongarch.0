Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1A544684C
	for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759484; cv=none; b=GZofNQhNxJiU3dZt08ALmNqVHbll7oibFU03bDI6etaxfXVSZcr6ZVCDRiifMG94Uz01Q3K3Rf2WblMUQM6Bne8YFajV3st4STnoPpHc8CVT3f6PbMcry6DQtNFstFeR948+e8Y1jz0oJ/56BF8JZ3kSQTOiOmdLXQqedPkSjAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759484; c=relaxed/simple;
	bh=KssTm3LFacwHpJdazg/gZ1oAwfHEd+OExs8ITeP7ULk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRCJEI4PaLXwkg1KSgqjyn5uogxVJPdeg2YeHK7NPh3jJzyQ5ATTpD1Jp1MTppOrNh1fWOfiIXDuYKzoJRe2yqUFGjCiGy6KrBCfmq+c+H9G7js/SdBG5fvWZu28Ub5egsq2ofIQLZWiOeynpOulNYJRzoZvAoZKYLJ+k9C6qz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkrcqIYW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkrcqIYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
	b=dkrcqIYWYJX5W/qfiLe9L5guY25x7yUxZLWC801CstOZEpfpZB/utr8v+yKxo6wksBmZKQ
	hs977HBVp3ptBUVTryAQrhmzsX/ciIJdmRHNwtCwZTD31bZ8F1dLERwK4P7t3olvZ0lPu1
	IKPKbHJ/hLh2/0+zMHCOJzcn3lKdH0I=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-TAxM70RsP3a67-cnUBWoXA-1; Wed, 26 Aug 2026 11:51:12 -0400
X-MC-Unique: TAxM70RsP3a67-cnUBWoXA-1
X-Mimecast-MFC-AGG-ID: TAxM70RsP3a67-cnUBWoXA_1787759471
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d5d00fd19bso22553155ad.1
        for <loongarch@lists.linux.dev>; Wed, 26 Aug 2026 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759471; x=1788364271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
        b=TpAlCnSwBh41d2Hokq8igZW2WtaNCuznD7arMcgdC25j9jhY4BS8N6jy4R+QP+Xezz
         2EY6LPnpUJDciM49zsKCyLKYtZzdK6i8yMje85mtEC7NUdEFv0VPy5oDP2BW7kj7W3Ld
         v5gIqjC7j10ktsKS94RuXff2SRAiOCwBWNhlBoByeFeIom6sNbP8pkUpQND/tiTADYrs
         Q65PdesLWxNF1crTcCuacdlGpWw0WRphrdnaqsxp6bhkRWCvmFfVjsxVeqljGHcQxLpL
         HrcUtRYzHZNyCWr4I0YQbR9mhi+H6sQdurLh4ZzuObwDp01EQKV6iBDdjP9wOXS0AOOs
         kXXA==
X-Forwarded-Encrypted: i=1; AHgh+RokLrrbqJTmD+VNOGTsjtI1rgYsBTc2qxYH9y9M5rngMe75n1QN3KWSJ6fA0L7guUhr1Dp5DXvJqLY=@lists.linux.dev
X-Gm-Message-State: AFuF++kPmO9qydjxFf4ox+eHMmwrdNZtxkPZtYMvdflBpXL7CtkXHlDq
	h+AXyAf7eeql74USC/V24wgW8M3Xr20YIw0PA+P/tDeUI8nwuCFpoSo1Lnwglfw8JPLI48ZTQcl
	Au6GxyQYpRTgTbxU7eP6H0cQRrmU822x13VBk5J496XLbI2geJAPcYLzOWGL+dg==
X-Gm-Gg: AR+sD10Zpe0dRa/82JALd85ea3vKkxpi4lNcWGAaDhPUpwaYoRWCcW0VzltWYjKeG7a
	gCkHsxFe/Mpw7MQgcU7VFJMa9gkmKVGKlAxmg6m6+HPI1Q/PnJ4M0Eia1aAK7mqkI3s2VI8s920
	yhqo4aMhjNrb7z4k/Hf+hUZ+dpCdWbktBQXF2NIetBAXrJBu69L4Cg4vSysKCcUvKmydklhtE1G
	EAqU4ATbddkLWVF66SkAh/SyUb8ifpVVBQ0kypy5B/xCYyLygirYia2cG+PTCE3sWsSdjwBF9nQ
	fuunPVbK7KlVSe5HmX+IUttQYjVMSd6ZNBVXNJrIM3nhWWzdSF/5Sh40jk00G4+qlb01Qan6c+j
	aQg0iR+7Cr0yxLNBl
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155457505ad.2.1787759470995;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155456345ad.2.1787759470546;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bf8978sm9118965ad.57.2026.08.26.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:51:09 -0700 (PDT)
Message-ID: <ac453410-67c6-47b4-ae79-fa682780fe49@redhat.com>
Date: Wed, 26 Aug 2026 21:21:00 +0530
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
 <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
 <ao2xc027TNYTwBA1@willie-the-truck>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <ao2xc027TNYTwBA1@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 47Qs3yEAMtrY9bcoifNvidopWGTNAtYZKyzMbxWNJe8_1787759471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Will,

On 25/08/26 8:44 pm, Will Deacon wrote:
> On Tue, Aug 25, 2026 at 10:43:48AM +0530, Mukesh Pilaniya wrote:
>> On 24/08/26 7:37 pm, Will Deacon wrote:
>>> On Fri, Aug 21, 2026 at 07:19:57PM +0530, Mukesh Pilaniya wrote:
>>>> Several kexec_file_load() image probe functions return -EINVAL when
>>>> they do not recognize the image format.  A probe function that rejects
>>>> an image should return -ENOEXEC to indicate that the image is not a
>>>> recognized executable format.  -EINVAL implies a problem with the
>>>> syscall parameters, not with image recognition.
>>>>
>>>> kexec_image_probe_default() iterates through registered loaders and
>>>> returns the last probe's error code to the caller.  That error
>>>> propagates as the kexec_file_load() return value to userspace.
>>>> Returning -EINVAL from a probe when no loader matches is semantically
>>>> incorrect and misleads userspace about the nature of the failure.
>>>>
>>>> Return -ENOEXEC from all probe functions and their helpers when the
>>>> image format is not recognized.
>>>>
>>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
>>>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>>>> Reviewed-by: Bradley Morgan <include@grrlz.net>
>>>> ---
>>>>  arch/arm64/kernel/kexec_image.c   | 4 ++--
>>>>  arch/loongarch/kernel/kexec_efi.c | 4 ++--
>>>>  arch/riscv/kernel/kexec_image.c   | 4 ++--
>>>>  kernel/kexec_elf.c                | 4 ++--
>>>>  4 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> Hmm, so after this patch, are there actually any implementations of .probe()
>>> that return anything other than 0 or -ENOEXEC? I couldn't spot any after
>>> a quick look.
>>>
>>> Willkexec_elf_probe() can return -ENOMEM if memory allocation (kzalloc())
>> fails inside elf_read_phdrs(). This behavior was previously discussed in
>> the first patch of this series [1].
> 
> Fair enough, but I'd have thought it would be easier to special-case the
> one -ENOMEM path instead of changing all the backends to return
> -ENOEXEC all over the place (and hoping people don't start returning
> -EINVAL again in future).
> 
> Will

Returning -EINVAL from a probe on format mismatch is semantically wrong
on its own — independent of how kexec_image_probe_default() handles
the return value.  x86 bzImage64_probe() and s390 s390_elf_probe()
already return -ENOEXEC correctly; this patch just brings the remaining
backends in line.

Also IMHO, checking for err != -ENOEXEC in kexec_image_probe_default()
is more robust than special-casing err == -ENOMEM.

-- 
Regards,
Mukesh Pilaniya

