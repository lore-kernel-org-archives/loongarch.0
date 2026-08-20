Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B620B38DC5C;
	Thu, 20 Aug 2026 18:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249480; cv=none; b=DEIzP9lu88Q7ySf5ejfblHSeHURSzpUilV+SSdtcIoypT0sGyVgYRJpvLo5fRDUuLqGea+fcrnWldPgtWdczo/OxxrO84qzzSqrV/rZWdVcOhdyyWM2Ht8AFJ3sg/b8KuY4Tgil5RYl/WdpYcF0MpPNAgurPhbNJpiomPWMYRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249480; c=relaxed/simple;
	bh=hSK/+G37F84BGR1/YCXbpXHVFmvmGqn0YwgzKU7kPBg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M2vUji2oiiphdEfhw4BvmUs/QiVp7aow9U7rImIlm56MxhO17UR4vjA963KngKU6JxZd05nsfSawKpV/d5XSQ92f2pXXqnEXAQyr+1ge1CC4nGMLkCK6/SEXl9I1Llg3BzgvNOYGog2v49k8Glg7V3jD1Iv6ywfjlYoQnwqHe4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ff04qASp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ff04qASp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9D21F000E9;
	Thu, 20 Aug 2026 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249479;
	bh=6VimjWe3SmWZw3TNJVt1GnwULpIdvyBeLBzyA9oKCVE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ff04qASpnnH+GDL7vbbffBf0ro3l6ENId2a1UaG+kDxmpLGG9E/rRV8i0D6rOl3XN
	 wgxtGXB7UiV3blQzR27KjmkLdOWK6DZ7aWFU9oatFUX2e4j1XViEmrUEG1zFN9GHNn
	 WFOLI43qiCQ7ydx8oyzBlkLLDXLVCQnk3Qd8r9vtidG3JgSaat0NTyiVjaxr5kbsRy
	 /nMChtOImCKK1XOsLycua5DxDT0autDeembT79vP3FvbU1WkHlIaI6YZc4nwuRBNpf
	 s1J8dxXB66OukDIpjwkKfdKZ1ChSWeVZ/L9K34Gfa7vtHGKEMKsJfzo5pTUtcgPotU
	 +xlFa/ZaUx/8w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Philipp Rudo <prudo@redhat.com>
Cc: Mukesh Pilaniya <mpilaniy@redhat.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Huacai Chen <chenhuacai@kernel.org>,  WANG Xuerui
 <kernel@xen0n.name>,  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti
 <alex@ghiti.fr>,  Andrew Morton <akpm@linux-foundation.org>,  Baoquan He
 <baoquan.he@linux.dev>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pratyush Yadav <pratyush@kernel.org>,  Tao
 Liu <ltao@redhat.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  loongarch@lists.linux.dev,
  linux-riscv@lists.infradead.org,  kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
In-Reply-To: <20260820142114.0a36ac78@rotkaeppchen> (Philipp Rudo's message of
	"Thu, 20 Aug 2026 14:21:14 +0200")
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
	<20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
	<20260820142114.0a36ac78@rotkaeppchen>
Date: Thu, 20 Aug 2026 20:11:14 +0200
Message-ID: <2vxzik54zmpp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 20 2026, Philipp Rudo wrote:

> Hi Mukesh,
> Hi Pratyush,
>
> having this patch makes sense. Personally I'd go with having a
> switch-case rather than individual if-blocks. E.g.
>
> 	switch (ret) {
> 		case 0:
> 			image->fops = *fops;
> 			return 0;
> 		case -ENOEXEC:
> 			continue;
> 		default:
> 			return ret;
> 	}
>
> IMHO that is better readable and easier to extend in case other error
> codes need special handling as well. But that is only my personal
> opinion.

Well, IMO both look roughly the same so I unless Mukesh prefers your
version more, we can keep it as-is.

>
> Independent on which implementation you use.
>
> Reviewed-by: Philipp Rudo <prudo@redhat.com>

Thanks for reviewing!

One tiny suggestion. Can you please reply in-line the next time around?
It is a bit easier reading this response below the code that it refers
to.

>
>
> On Wed, 19 Aug 2026 23:17:23 +0530
> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
>
>> kexec_image_probe_default() overwrites ret with each loader's probe
>> return value and returns whatever the last loader returned when no
>> probe matches.  The error code reaching userspace depends on whichever
>> loader happens to be last in kexec_file_loaders[].
>> 
>> Only continue to the next loader when a probe returns -ENOEXEC.
>> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
>> only when all loaders have been tried and none matched.
>> 
>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>> ---
>>  kernel/kexec_file.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>> 
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index 59fb9d71e9d8..b3060e984ef3 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>>  			      unsigned long buf_len)
>>  {
>>  	const struct kexec_file_ops * const *fops;
>> -	int ret = -ENOEXEC;
>>  
>>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>> -		ret = (*fops)->probe(buf, buf_len);
>> -		if (!ret) {
>> +		int ret = (*fops)->probe(buf, buf_len);
>> +
>> +		if (ret == 0) {
>>  			image->fops = *fops;
>> -			return ret;
>> +			return 0;
>>  		}
>> +		if (ret != -ENOEXEC)
>> +			return ret;
>>  	}
>>  
>> -	return ret;
>> +	return -ENOEXEC;
>>  }
>>  
>>  static void *kexec_image_load_default(struct kimage *image)
>> 
>

-- 
Regards,
Pratyush Yadav
