Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE95639099C
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318588; cv=none; b=VyrWc/OqluDuWj5Drw/1k8zFhvfiBFALWKMG0nrkugudByd1o80uW+nxP/QC5meMoDzP6RxQTRNt3ug7ly099PQEiZ18PbuvPeKgPn1gHAoGbAPZ3iG9dZ8HzMB1tV4WXcH2rWXj4HW4c0K9p70OWMm25taYeIGrITsb1UMDTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318588; c=relaxed/simple;
	bh=UN+XnWuwaeAZ1O/mhj1Cyi3C2jGioQY1BU3xg8YedPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVroXKn+YdmjA3Ig+6+DJ9yRgQG7eRgQ2KfKZLlutQawYl3q5Fwk9VjWIZcLYmgYzC634AKjU/FCsyhJjxE2OHzSSUkTCFI9SXmV6iysM4imsm0zmlG8lwb5eY6haZmex6SK7F2Xkh9k+Prz+mJtooIFUqDSvVsFQURn24+zN0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YkYXGGcm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YkYXGGcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787318576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
	b=YkYXGGcmwi9AG/sm0VkkStgG1aa98dzwds6f1iqlbVjdpSb/81qvzkeEdcSgU+hc27qxwe
	OHsxFG4IxDNI59e8Ug/TKSVSbku5kUT+v7J3ebOT2savjlwDydibbC9+Bu/7tYtutwfdDL
	0GGNIChRc7c28ORJn0DSReDrfMHt9xo=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-e1Rvwpr_Mt6qF6Q_tWL29Q-1; Fri, 21 Aug 2026 09:22:55 -0400
X-MC-Unique: e1Rvwpr_Mt6qF6Q_tWL29Q-1
X-Mimecast-MFC-AGG-ID: e1Rvwpr_Mt6qF6Q_tWL29Q_1787318574
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso1065045b3a.2
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 06:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318574; x=1787923374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
        b=diLbk5cGYtmgoQ+RlMhDQYnB2/AqborlDWnXOxMWdO4vQNIF8qo214jP+co2WmIBn6
         qR6Qc9kcUy7IrK4s0s5axVKtGfBOa16kDaH+zLM/lguEaKIpG4Ny/HigmsCQr7uzGgXs
         aRj3Ytz9SLOVSj8KJnF46cueWTOg49f/6CbRBNtQUhGUCRPka7s/SJjyPXQC6rl0Nvlc
         S/q04c8YQ5vI4S6tBEoGgzOL+enFqH4wC43r0EAl+XodXyRPIUmsV5+o2KqvTVZsPdjf
         gV1+PLaA9D7lfcmP61HTZnb6ut0nUUKE9Nte83bIBNLKx3Cdc4ZX1NCpen6dDOhEDfhV
         kAKQ==
X-Forwarded-Encrypted: i=1; AHgh+RombQBfZppACYHFmFMIgCxBf4VXhqXUj74VurghZIKODy/y/ziXHA9IOz2+DOWFRLurFtAYak9hZz8=@lists.linux.dev
X-Gm-Message-State: AFuF++nXZwn1u5HjbukXBfQJ//oPCyfW8qLXB/9CGXxGQ/i4m7Sm8Rkb
	Zh6IZcgTN5grlEmGe5QRXiQWEEeMMqhCYGkOoHI2zNAGquwmTP1tdxiila1VKkpIqcmp7OpGhhZ
	1H/AYHuMrklQK2wefhv/qOMSH2qqmkFEoWyt/d08VtjaCBh1cLyKmvUGu+JnC9Q==
X-Gm-Gg: AR+sD13yi+UkYnx9maFkjGFTDYHETL+f5nN8Q11VPLWlTKaw0pZeAzXr5r/Cw0P9W8T
	zJFTpMAIxziYVsnDk5Fzn5ZCtLyPrp5hDQdcSIpCNx/QVzSvpH607C5osdNcFBXWIiUwt5pqWgG
	YR/oiOQBH66AAg0avqTeJ5WK9NqeL8ZXWswLhfgBXak5mKnirBL5HR+kQjNmp56gH8XEYD41GGv
	GtkjrtJiFELBT3vik66ILnf6XLvaIPzWaJfP1u7rg7s7neReepziT29YjEYikjSY4iXSHUvCXwE
	GuthH7xQYswTFDbF1G3xe/6lGM4WBtqCHhpopipBYXVUuAjICrfUmjaLGVDWI1ohxuLctqrYQCI
	ARm6zi2yi5a0M104oSA==
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345706b3a.3.1787318573995;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345592b3a.3.1787318573542;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389a37sm2905604b3a.15.2026.08.21.06.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Message-ID: <62cb1c7d-aa17-4d6d-b780-97cc40b7ff91@redhat.com>
Date: Fri, 21 Aug 2026 18:52:44 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
 <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
 <aogHeKQ8UnudNAMu@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aogHeKQ8UnudNAMu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I_xqrKco-f65KluWYmEwXPDa5GAR1WdB489ses6f3oM_1787318574
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike, thanks for review.

On 21/08/26 1:38 pm, Mike Rapoport wrote:
> On Fri, Aug 21, 2026 at 12:48:15PM +0530, Mukesh Pilaniya wrote:
>> Hi Philipp,
>>
>> On 20/08/26 11:41 pm, Pratyush Yadav wrote:
>>> On Thu, Aug 20 2026, Philipp Rudo wrote:
>>>
>>>> Hi Mukesh,
>>>> Hi Pratyush,
>>>>
>>>> having this patch makes sense. Personally I'd go with having a
>>>> switch-case rather than individual if-blocks. E.g.
>>>>
>>>> 	switch (ret) {
>>>> 		case 0:
>>>> 			image->fops = *fops;
>>>> 			return 0;
>>>> 		case -ENOEXEC:
>>>> 			continue;
>>>> 		default:
>>>> 			return ret;
>>>> 	}
>>>>
>>>> IMHO that is better readable and easier to extend in case other error
>>>> codes need special handling as well. But that is only my personal
>>>> opinion.
>>>
>>> Well, IMO both look roughly the same so I unless Mukesh prefers your
>>> version more, we can keep it as-is.
>>>
>> Thanks for the review. I agree the switch-case reads nicely, but since
>> the current version is functionally equivalent and already
>> reviewed, I'll keep it as-is to avoid re-spinning for a style change.
>> Happy to switch if you or Pratyush feel strongly about it.
> 
> I'd like to request another style change :)
> 
> In newer code we often use 'err' rather than 'ret', so it's more obvious
> what this variable about.
> 
> I don't feel strong about if or switch, but if you go with if, please don't
> compare to 0, use !err.
>

Makes sense, will rename ret to err and use !err in v3.

-- 
Regards,
Mukesh Pilaniya

