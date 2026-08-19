Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2183CBE74
	for <loongarch@lists.linux.dev>; Wed, 19 Aug 2026 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787119107; cv=none; b=t3JfmJPezMtQGaJMwFtYMsU5YJRda+APfht5UUKI1uCTMn7XJnIZ+B0t9a3OoD1z51mGqiizwNHoXmFxTdp8IhzLfW/kq/37v80PKvDOnSDM+C/FSJ50if3p6gMJpPzcA7T5uVY9Lz8CDILG5BmONqeVZm/w74jqHM3WYJnDkOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787119107; c=relaxed/simple;
	bh=X7OAjoz45ruqsmKdUnSzuXYAV49gETzN7qtOUQui5+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTw9yBEwOMowxJFrWfQp0VYRgVhiUYlxDBsnO7Dr4rzb2pwFlggT7B4S5kq2oPjPSK1HyszK3VyZpHiWpc4FPFzKN8SKooVMMDLHcPIxzsaBv1Xeolak+/FM55AcRm5msT/jOWFZHGLv+Zs93NB6epX5GDMwtWfBqjlt7zAXSoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q/N35m2a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q/N35m2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787119104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
	b=Q/N35m2ajlLhA4c8nyU1FtuJF/QRGgUmfgGrfGnI6q/mmfvBQwJ5KvsLcqZV0guDZn5FXk
	ZnGQzxz8YoMEfPlD/CCzUAXcFn5HrN+cINMJEFBbcXCuOHU2W49XFr0tNsz8MJFY8S1EnV
	MZNcSifIGL37+IoI1gS5FX2Ukx0qCO0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-MaeUuF3IMviw3kuP2bwEAA-1; Wed, 19 Aug 2026 01:58:23 -0400
X-MC-Unique: MaeUuF3IMviw3kuP2bwEAA-1
X-Mimecast-MFC-AGG-ID: MaeUuF3IMviw3kuP2bwEAA_1787119102
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so9460455ad.1
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 22:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119102; x=1787723902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wN405h1WvQQ42J9aP5itCeH3PDbeYvXDW/m8ee+hMM=;
        b=eUvQWGVYRuDnQY90fzv4BM6tnDRcrc+sY99FpdPu+O/7Pisto9DTsrb4JTB0kS/q8G
         3p/J7hvqSjvQtE4k0RMDiDEINN8TCCJns6toR8y5dVMOfWGdWtMBmzNp9i0szDlZea6c
         xLvNXeJKvrwA9hbKVV6ksrYkwZpRyfn4DkeKuxqw39Ok9RGbKczTAPTio/LSUVGmDpPQ
         3fy8e8O8OwCxWWEdM3xf8CiV2h4n0MX5YYJ5tNFTAaPjGMHM7CjSP8P/NeLVMXuhArIP
         FAS0rEJB3MqaB82jf6n+ZZJ11e8x/6NsRRg7Xa9IreiPpCQEoFdRBF3n+Ru1DPIzXkc+
         KZfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc9ucKjF1qkIxUGKqCYpwhtNOePBYRqDQxtSzzrnjQ25Il5vtEDo/17iKFrdK3bitdYEaMBjKYSw0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyef2C7wqdF/s1hMQlgU88nibqDoTcfLu5T/y5CaVNSM/rbEYuB
	gVP5gpCRrvQJWfnZty+SVEPDhYGNhchPPjIbPqPUh8pu+XzvQC4oaHOe0nojX0PN0ryJw9qo6dS
	9vsE6aJ+4/mfwqVILSCQYhJnWIm/ziSiVaNbb49DobNMgNTkP+f+gV99iEFSGGw==
X-Gm-Gg: AR+sD138aAL4eINyt7+S1a//W20wQsrGdcA2/diqxkrYC0WKGqeM4U/YNDkMNht6oEW
	VdRGjYoqYGI3Rv8aCI2meO6nwZXYk0JA28eWUaAA+x/9jpoD4HRR4Vn4ylQxVIrvnyarBbdUomb
	9WGqBd/hroYI2cH0LM69eMD3KsIolOdQ+hpUzvmM39s5JJvCKFQSYH87T/EkZodvXsX+bZfcMIa
	Nu/3nlsAQitLGWSz5nXNAPvYQOL9uK2ICZrYDdcawQsbXq5fAddZPLjGJXN37zmfNVJ9S+NT6Zw
	RD3lti/HEMOFXFRS0ZJp2ssEK36lOuCsP5NRhfIyViIqGEDdIdXnLQIhfeko2KLcIfV+I6j0o+/
	VnfqsoJ1d/On4U0YizzvW
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41700125ad.6.1787119101996;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
X-Received: by 2002:a17:902:fd87:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2d5fd6b0aebmr41699365ad.6.1787119101427;
        Tue, 18 Aug 2026 22:58:21 -0700 (PDT)
Received: from [10.76.99.122] ([115.110.236.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e5506asm20846515ad.43.2026.08.18.22.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:58:20 -0700 (PDT)
Message-ID: <0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com>
Date: Wed, 19 Aug 2026 11:28:10 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <2vxzv79c23j6.fsf@kernel.org>
 <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
 <2vxzbjaz2269.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzbjaz2269.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HeHzvIoYBD8snZLaVEanqW0wVfk6R1hBdH8EPlx4K6U_1787119102
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pratyush,

On 18/08/26 3:14 pm, Pratyush Yadav wrote:
> On Fri, Aug 14 2026, Mukesh Pilaniya wrote:
> 
>> Hi Pratyush,
>> On 14/08/26 7:43 pm, Pratyush Yadav wrote:
>>> On Thu, Aug 13 2026, Mukesh Pilaniya wrote:
>>>
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
>>>
>>> Sounds fine in principle but can you please also share what the real
>>> problem you face is and how changing these return codes helps? These
>>> error codes are uAPI and while we _can_ change them as long as we don't
>>> break something, there should be a clear motivation for doing so.
>>>
>>> [...]
>>>
>> While debugging a misleading error on s390x where kexec -s reported
>> "syscall kexec_file_load not available" instead of the actual EINVAL
>> from a kernel command line that exceeded the architecture limit, we
>> traced the problem to the kexec-tools userspace utility treating
>> EINVAL the same as ENOSYS and ENOEXEC -- as a signal to silently fall
>> back to kexec_load().
>>
>> kexec-tools supports two syscalls: kexec_file_load() and the older
>> kexec_load(). With -a (the default), it tries kexec_file_load()
>> first and falls back to kexec_load() when the syscall is not
>> implemented (ENOSYS) or the kernel does not have a loader for the
>> image format. With -s, it uses kexec_file_load() only with no
>> fallback.
>>
>> When the kernel returns -EINVAL it means something went wrong while
>> loading the image, not that the syscall is missing or the image
>> format is unrecognized. kexec-tools should not fall back to the
>> older syscall in that case. However, some kernel probe functions
>> currently return -EINVAL when the image header does not match,
>> instead of returning -ENOEXEC. Keeping EINVAL in the fallback set
>> to accommodate these probes has the side effect of also hiding
>> genuine loading errors like an oversized command line.
>>
>> kexec-tools should only fall back when kexec_file_load() is not
>> implemented or does not have a matching loader -- not when something
>> goes wrong during load.
>>
>> The fix on the kexec-tools side is to remove EINVAL from the fallback
>> set, but that requires the kernel to be clean first -- probe functions
>> must return -ENOEXEC when they do not recognize an image format, not -EINVAL.
> 
> Okay, the idea makes sense. Though I am curious if in practice there are
> images that kexec_file_load() can't load but kexec-tools can.
> 
> But then I went and looked at the code. The only caller of the probe
> functions I can see is kexec_image_probe_default(). Looking at its code:
> 
>   int kexec_image_probe_default(struct kimage *image, void *buf,
>   			      unsigned long buf_len)
>   {
>   	const struct kexec_file_ops * const *fops;
>   	int ret = -ENOEXEC;
>   
>   	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>   		ret = (*fops)->probe(buf, buf_len);
>   		if (!ret) {
>   			image->fops = *fops;
>   			return ret;
>   		}
>   	}
>   
>   	return ret;
>   }
> 
> It defaults ret to -ENOEXEC, which makes sense, but then lets it be
> over-written by each loader. So in practice, it returns what the _last_
> loader returned. _This_ makes no sense. Why should the last loader be
> any special?
Right, the last loader overwriting ret, the commit message describes
this as well. It makes no sense for the return value to depend on
whichever loader happens to be last in the array.

> 
> From reading the code, I think what the author of this wanted to do is
> to try all loaders, and return -ENOEXEC if none succeeded. But the code
> of course strays from that and ends up returning the last loader's
> value.IMHO the function should only try the next loader when a probe returns
-ENOEXEC, not for any other error like -ENOMEM, which is a real failure
and should be propagated immediately, not silently discarded.

> 
> So how about the below diff instead? (** only compile tested **)
> 
> --- 8< ---
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 2bfbb2d144e6..cfb2b8cd5679 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -67,17 +67,16 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>  			      unsigned long buf_len)
>  {
>  	const struct kexec_file_ops * const *fops;
> -	int ret = -ENOEXEC;
>  
>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
> -		ret = (*fops)->probe(buf, buf_len);
> -		if (!ret) {
> +		if (!(*fops)->probe(buf, buf_len)) {
>  			image->fops = *fops;
> -			return ret;
> +			return 0;
>  		}
>  	}
>  
> -	return ret;
> +	/* No loader found. */
> +	return -ENOEXEC;
>  }
Nice catch, Pratyush but this discards all non-zero return values from
probe functions, which means real errors get swallowed. For example,
kexec_elf_probe() can return -ENOMEM when kzalloc() fails in
elf_read_phdrs(). With this diff, that -ENOMEM becomes -ENOEXEC, which
tells userspace "no loader found" when the actual problem was a memory
allocation failure.

>  
>  static void *kexec_image_load_default(struct kimage *image)
> 
How about the following instead? It keeps the probe return value and
distinguishes -ENOEXEC (format not recognized, try next loader) from any
other error (real failure, propagate immediately):
﻿
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 59fb9d71e9d8..ceb5c97cedac 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image,
void *buf,
 			      unsigned long buf_len)
 {
 	const struct kexec_file_ops * const *fops;
-	int ret = -ENOEXEC;
+	int ret;

 	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
 		ret = (*fops)->probe(buf, buf_len);
-		if (!ret) {
+		if (ret == 0) {
 			image->fops = *fops;
-			return ret;
+			return 0;
 		}
+		if (ret != -ENOEXEC)
+			return ret;
 	}

-	return ret;
+	return -ENOEXEC;
 }

 static void *kexec_image_load_default(struct kimage *image)


This requires probe functions to return -ENOEXEC from fixes in patch 1.
I will add this as a separate patch on top in v2.

Does this looks good to you ?

--
Regards,
Mukesh Pilaniya

