Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D522F767
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 07:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296721; cv=none; b=I2r0Hga3EYcDXwkhXFCLkUWaeZOeeniteZ8obgilAEIPU+FiTpoqIGR2r+Q+GRHoH3sBSWJWOwgqn9g6tolLUbY/8Cn2INRH1XMgT57ft+ORQzyoxTUJRh0W0JIzlUadUX1eM4fag86Rh8Gi4EzmrWy2ejyiJR8mERF7d34yYEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296721; c=relaxed/simple;
	bh=mCtJJhD7UgMOBv0lxTBLCEO+2G+dwpHy7Km6h3DX9p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjqyIOnlo1e/CPk5YW6mUgajz8Wj6FB/X39HE+QT1Xut8eG9/GWUEI5QDybP8Ntl0Zz56MOJfuw+BQGpmhJv3uAt5e/esBJU8jXpgKTatkugYKczwfreDQYgrJu4MpIqNOGLBcN9W0LTCdK6w610xDoyYrp1x5NVb4P1kv6zKT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVjYQZzX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVjYQZzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787296718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
	b=ZVjYQZzXFX1PGHsHJoItCFwAdnFShoEOKY84AvBJ6OwBe2rRWC/ajFmRWoPRgq7NOv11uO
	+iRy8UKJ4ujfAdHF2uVn2KAF/WXL7xLQKK2y55ncnaEwlBU0dDN+hOqAi4HWJh+Hg6VTNb
	SoLEvS/oPhe+LchwAwcGnG/YmMqsZAc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-IzU9NxUeNKacof8bAJZ0bw-1; Fri, 21 Aug 2026 03:18:26 -0400
X-MC-Unique: IzU9NxUeNKacof8bAJZ0bw-1
X-Mimecast-MFC-AGG-ID: IzU9NxUeNKacof8bAJZ0bw_1787296705
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848d21bbb55so1085348b3a.0
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 00:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296705; x=1787901505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
        b=Q1O6nevoH/8NWsvCA5bY2vw9PyHPczqidsnfgXawLfykcM9bDCxU4LYXvUptD6BOy6
         TtwbbtGoX46p8ZbPTbe9nHjxz46V8Na0sDR1czVt41Y1DGwSd67WCoG2DWVLTCz/0vjJ
         PDWLqvLLQlXefNg5Deo2Rz6HrFyn1y6aIDHi90H5CBTDiBqRHLIn+JPUomaMfo4MYH4T
         3wr3Npy0aqDN8/aMhl6QfP0jAv47LD6CGKXpEUSzc5FZK1MRdqMYLWbAbrAHOOx7igdc
         vt558hGiy4/x4btd7jAMwZhRMknAo6BGlHgecHywnBLj7+7Y0VpOYuZK/QX57zvbH+9l
         ZYOA==
X-Forwarded-Encrypted: i=1; AHgh+RpH9gBk2TIbBrPrmY0oSlxVMqLAEiHjZRv/r3KJW+6lrAm83QAAYiGMiQ/zjv/mO6tEbSxeKdgql6o=@lists.linux.dev
X-Gm-Message-State: AFuF++ncMzfSizwLDlBM1gesy39jdkyZzTvD+jfZX3J7SrMHM9ib48Ma
	TpFoOCFi9aE0ijZ6FPXNLAY/88wuEwD6pSutIa7Vgm1Spy8JATh9IFlmpKZqvSx7l+RytVRrqjz
	mKpfjRT6IM0P+PdIWTi2b+RhqDP4d1hxp2lX9Xwv8DHOkvZSQhz1TYhx1orLnG3BxWbr2aA==
X-Gm-Gg: AR+sD115JDXreNIBcJv5u4clMkZcu0ypJxnMRPaqdS5S5kor1sdLLGjlspimePDOYem
	oMKtuMSdgefKfNp7xnznxJQYJxzi23ybF5InzuX7FJkA8+4PHAoly5n6xGHR4MXNogYE2a+zvMN
	N+mMiNN0o1UHonZama9m0qEhyjaDC2AJXeYvL9nkej9KViExYxY3Qyp7I0m2hwFfuS2tNYpVBWT
	9J1EzlNiM+nPZnvCJTFkfm/UEOu0+xqaeN0zPkmUL3761o/tdmVN6WvVdMoKCKEd7Vz3Yu0gEts
	MO0/v1l9OR5gN6q6S+BBTDxvFQxDeUKb4W8AYDBxUi1HhkLxm8MZlYMjJOPsyInGT8eDpBXhcdd
	5ZfwTXXo9Jg94n20cvA==
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258590b3a.8.1787296705130;
        Fri, 21 Aug 2026 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258522b3a.8.1787296704696;
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3361d24sm2509087b3a.5.2026.08.21.00.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Message-ID: <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
Date: Fri, 21 Aug 2026 12:48:15 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzik54zmpp.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YzHSnmx5XzHIWJFzK8--VheGjoDPbDWTk6Uq-UJHVTo_1787296705
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Philipp,

On 20/08/26 11:41 pm, Pratyush Yadav wrote:
> On Thu, Aug 20 2026, Philipp Rudo wrote:
> 
>> Hi Mukesh,
>> Hi Pratyush,
>>
>> having this patch makes sense. Personally I'd go with having a
>> switch-case rather than individual if-blocks. E.g.
>>
>> 	switch (ret) {
>> 		case 0:
>> 			image->fops = *fops;
>> 			return 0;
>> 		case -ENOEXEC:
>> 			continue;
>> 		default:
>> 			return ret;
>> 	}
>>
>> IMHO that is better readable and easier to extend in case other error
>> codes need special handling as well. But that is only my personal
>> opinion.
> 
> Well, IMO both look roughly the same so I unless Mukesh prefers your
> version more, we can keep it as-is.
> 
Thanks for the review. I agree the switch-case reads nicely, but since
the current version is functionally equivalent and already
reviewed, I'll keep it as-is to avoid re-spinning for a style change.
Happy to switch if you or Pratyush feel strongly about it.

>>
>> Independent on which implementation you use.
>>
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> 
> Thanks for reviewing!
> 
> One tiny suggestion. Can you please reply in-line the next time around?
> It is a bit easier reading this response below the code that it refers
> to.
> 
>>
>>
>> On Wed, 19 Aug 2026 23:17:23 +0530
>> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
>>
>>> kexec_image_probe_default() overwrites ret with each loader's probe
>>> return value and returns whatever the last loader returned when no
>>> probe matches.  The error code reaching userspace depends on whichever
>>> loader happens to be last in kexec_file_loaders[].
>>>
>>> Only continue to the next loader when a probe returns -ENOEXEC.
>>> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
>>> only when all loaders have been tried and none matched.
>>>
>>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>> ---
>>>  kernel/kexec_file.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>>> index 59fb9d71e9d8..b3060e984ef3 100644
>>> --- a/kernel/kexec_file.c
>>> +++ b/kernel/kexec_file.c
>>> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>>>  			      unsigned long buf_len)
>>>  {
>>>  	const struct kexec_file_ops * const *fops;
>>> -	int ret = -ENOEXEC;
>>>  
>>>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>>> -		ret = (*fops)->probe(buf, buf_len);
>>> -		if (!ret) {
>>> +		int ret = (*fops)->probe(buf, buf_len);
>>> +
>>> +		if (ret == 0) {
>>>  			image->fops = *fops;
>>> -			return ret;
>>> +			return 0;
>>>  		}
>>> +		if (ret != -ENOEXEC)
>>> +			return ret;
>>>  	}
>>>  
>>> -	return ret;
>>> +	return -ENOEXEC;
>>>  }
>>>  
>>>  static void *kexec_image_load_default(struct kimage *image)
>>>
>>
> 

