Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706403451A7
	for <loongarch@lists.linux.dev>; Thu, 14 May 2026 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777125; cv=pass; b=kZDA0QhQJHbGg+sxHsqmjuTpgSOgTY8DMfK4ILrXveRFylOubMtb5evvxBi7wP4x9MOVLxRkLIGD5MQiQmDO0xM/cckMlgKmuv5Cg1Mv8fizrXT6kbZOFmsk4/eGQzZUBCf0U7tVMcJG0jwmIKVrXlkDbAJgmlRj8f6Zpn6v9HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777125; c=relaxed/simple;
	bh=PmAIcppCWJmcGf0UnWT1GlVwFgygixvvwcZwvNaEkWE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpto/vFDUCXGMgu3aC/ERz2WWqwiI93qMMQY1kZfEfoHQKi2awNCOqj5BgPznCp/JRl+yXzwb5+4WsLlW3cXBvj6EkNI35PyZBvAUG47sleS/VfW4zE5nJGL6Cb9TbbpMBmz+W+LSf+N1CtB9aWCHWqHgnM7MYZwLw3yS7FL4Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HVg/0mBg; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HVg/0mBg"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso7290764e0c.0
        for <loongarch@lists.linux.dev>; Thu, 14 May 2026 09:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778777122; cv=none;
        d=google.com; s=arc-20240605;
        b=kuSZY3WZcQ2RTT7Qb/34e8pxB0fh2/7kwPQ8Zz/5KB7PWPdUXNBv+YYGLm5EH18MHk
         rcp1DrPqGFe7Bbs8e7KIKu/dqnOYVihic2t4+wxEDXVlIY5wHrByLiFQrHMu52N/EkAy
         FX1GAosdoADL9wnpEPslOEeI1w+zbhHuGo5yHhe3wZTXVBZaSD/ehPZOtrpSnNk+A/wq
         KcHbT4YyVn6obJNCDAsDKNaWwsT1Fe6xqA8G3sMrE3fz6T778MlZaPEtPMwt3vEJIxxg
         1PhPW1MmHcQ4JOW5rKNSCmiZF2BYpPfYd58RebnZBehuks5qOTT2PMqctNT0r6qm+dFA
         P9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        fh=yBwdURxzAlmXNlvTfZnTVzasUaackWFpaoChOgj4SXU=;
        b=LiJZSvPSxEdda98kR161QHO7jss34/sTJOwBWY6xmBuaUaT626BKg5zbZj47cqoVH8
         gGrE+llyEhEW96GcBnU81g6JbACoqrow2Dee5R+oX84mpJdUFMyGPaMfnA2B2sXlzEhp
         UI7UWRTxVVwrH2QsICaCJhEJA5l/wZoH6A129Xucu97hI9NEvS6hta7RtESoSFQvod+7
         1atVmWXm5Z1qP/p+VIc603Xq8pIkfaoHcjcLpgxSAcvE9M855J2HC4b/uxx9CK6bu/n3
         E0lmxehgAkEH+RhFDHEQWX6O2jUrejtHCBRsCYGVcaLKNFi3UnyEw15R4WgTFBgj2DIX
         WAFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778777122; x=1779381922; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        b=HVg/0mBgO+NQB5z7L8Fkdosk8QH0wPn1lM46sBnCqApNg6+YR4i6g/6PP1Jz1TKKdO
         hjBg0ZGIWAqtkGvVrBj/H52vY03AcZJG8UJddb4SW2HrQiWTzr7VuoxTysSZpau2UoRN
         kYDYZyF9z0NrSy2DxL2Pj5QHHD/+76gJjNAUtQbrVeTQ4daLjjuiDM6YJ9/MCJWVQCF6
         eiWx7Ow8PvADzjdw/kzGeipiK7tDiXKQPCIhhormzz7ZqiVu82kMWUZLhWFyqpZkBLJK
         Nh+J4ZOl+pQ0f9ZdmYO8Dq++rLIdD9vOWkPqyzLohS/eIWCTp+eiwAv46k87XH6f7r0z
         1Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778777122; x=1779381922;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=os0eHsZVJX0chVl1RmCC7RjaweXl8YpOUWjuIOShXWI=;
        b=lLSSfsQBXfL9DMVKGWTn3KKpJ9HbmMp4P4P6UsmCyz14ubemU6j+JEpdMwx3/yv4Ae
         URSfr0QauIia2g5pULmlmZ0Z7KZ3fEfF6Dj6ccQAJGpx89toj2t8HE/peQ6NIofIFQE5
         wJgoexGBa/Qn4mGOTDfNmFqpFjNWW8nVgadIZemaaULV2UocIcdFvmgQqsJQLHRkGzbF
         hI8EhCoGNZ6dQ4p3vsWcwmQNE36VXAKqXmdBKXfJGucy5oSG0wnGzDNf3DWJrebuyTto
         5i63zc33vMZdqNWUmxBr7RWHsqgrCoW76kTvlFOxWZPi8TjIKWSvCPyZ1kUmVG5T9ccU
         9aVA==
X-Forwarded-Encrypted: i=1; AFNElJ+k+hOyC2AHximOkmeQcLFqoJOdSySE+UyuEmIk8fii3Zk6d2RYEYGOAfsffBIcaE18pCaYXGfmRKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJGolIdOYwZ/ZpIoFSkGt6AxLSmHKn2sLsywUofZGwtP6QBaG6
	uy11gBvPtHd9BfZ4B5mfzVW03GISMUsnq2i6ctXiPwAQMf9cDQ3iFecpAVd/nLKM4WRgB2ox0Hg
	6eMbMutfR46Hw4W308yzQ5Bd7+9WBHmQpQTxtZYk7
X-Gm-Gg: Acq92OGwoWIUpjgqX74DI4wsIhkIF++hZe+RsU9UEQUNtlugcBigvpv4kPACk1TNh+v
	xJRgRFs6/pOrQsRq4jq0GFEcieFqhzfcd9bnRRs7dB7gmcommnKyNi/fCwZcE+garrbykdXo0wz
	najYyB3abRjyeDelYFC66eEsQAqPr/anzSldBSnrjFswDZhUsyYUHuurncrNQ0tmqu27xCKSm+a
	byh8JTJlYvRehTOP3Gtfk7pRk8wU8g1YWidC6Aikq+/wYUfPj7dZj4n3z26N27GfEa1A8/zKqw7
	au5HCEgxxsOMoLHRhbnTp+U4FJO7krU1ZkkMmCpNxj0oYX7tR3To/yGhuZUWV8H2DsMEKF2BhGo
	kskrF
X-Received: by 2002:a05:6122:1814:b0:575:178f:62d2 with SMTP id
 71dfb90a1353d-5760c092d3cmr165926e0c.14.1778777121451; Thu, 14 May 2026
 09:45:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 May 2026 09:45:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 May 2026 09:45:19 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260508081812.12345-1-itazur@amazon.com>
References: <CAPTztWb67XZvfcMVnbegDNNW0LJa9UsaTGx3M898xJUJrekk0w@mail.gmail.com>
 <20260508081812.12345-1-itazur@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 14 May 2026 09:45:19 -0700
X-Gm-Features: AVHnY4JqumP2VJstFZ-DobQ0sDmpWwtOhYCl663Ih2m9TKxeTUM0glktONR3Yps
Message-ID: <CAEvNRgG07EMrx-SpMaO3gHmdGVwOb75XNy7_RARBo0chidn7Yg@mail.gmail.com>
Subject: Re: [PATCH v12 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
To: Takahiro Itazuri <itazur@amazon.com>, fvdl@google.com, seanjc@google.com, ljs@kernel.org
Cc: Liam.Howlett@oracle.com, agordeev@linux.ibm.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, alex@ghiti.fr, andrii@kernel.org, 
	aou@eecs.berkeley.edu, ast@kernel.org, baolu.lu@linux.intel.com, 
	borntraeger@linux.ibm.com, bp@alien8.de, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, chenhuacai@kernel.org, corbet@lwn.net, 
	coxu@redhat.com, daniel@iogearbox.net, dave.hansen@linux.intel.com, 
	david@kernel.org, derekmn@amazon.com, dev.jain@arm.com, eddyz87@gmail.com, 
	gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, haoluo@google.com, 
	hca@linux.ibm.com, hpa@zytor.com, itazur@amazon.co.uk, jackabt@amazon.co.uk, 
	jackmanb@google.com, jannh@google.com, jgg@ziepe.ca, jgross@suse.com, 
	jhubbard@nvidia.com, jiayuan.chen@shopee.com, jmattson@google.com, 
	joey.gouly@arm.com, john.fastabend@gmail.com, jolsa@kernel.org, 
	jthoughton@google.com, kalyazin@amazon.co.uk, kas@kernel.org, 
	kernel@xen0n.name, kpsingh@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, lenb@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	lorenzo.stoakes@oracle.com, luto@kernel.org, maobibo@loongson.cn, 
	martin.lau@linux.dev, maz@kernel.org, mhocko@suse.com, mingo@redhat.com, 
	mlevitsk@redhat.com, nikita.kalyazin@linux.dev, oupton@kernel.org, 
	palmer@dabbelt.com, patrick.roy@linux.dev, pavel@kernel.org, 
	pbonzini@redhat.com, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, pjw@kernel.org, prsampat@amd.com, rafael@kernel.org, 
	riel@surriel.com, rppt@kernel.org, ryan.roberts@arm.com, sdf@fomichev.me, 
	shijie@os.amperecomputing.com, skhan@linuxfoundation.org, song@kernel.org, 
	surenb@google.com, suzuki.poulose@arm.com, svens@linux.ibm.com, 
	tabba@google.com, tglx@kernel.org, thuth@redhat.com, urezki@gmail.com, 
	vannapurve@google.com, vbabka@kernel.org, will@kernel.org, 
	willy@infradead.org, wu.fei9@sanechips.com.cn, x86@kernel.org, 
	yang@os.amperecomputing.com, yangyicong@hisilicon.com, 
	yonghong.song@linux.dev, yosry@kernel.org, yu-cheng.yu@intel.com, 
	yuzenghui@huawei.com, zhengqi.arch@bytedance.com, zulinx86@gmai.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Takahiro Itazuri <itazur@amazon.com> writes:

>
> [...snip...]
>

Brought this topic up on the guest_memfd biweekly today!

>
> Agreed with both of you.  I'll adopt the filemap-level approach:
>
> - Move the zap/restore hooks from guest_memfd into filemap_add_folio()
>   / filemap_remove_folio().
> - Tighten AS_NO_DIRECT_MAP semantics so that, for folios in such a
>   mapping, the direct map is invalid for the entire time the folio
>   resides in the page cache.
> - Drop the per-folio KVM_GMEM_FOLIO_NO_DIRECT_MAP bookkeeping in
>   folio->private, since the existence of the folio in the mapping is
>   itself the state.
>
> On each guest memory population path,
>
> - memcpy-based population from userspace goes through the userspace
>   mapping of guest_memfd, not through the kernel direct map, so the
>   filemap-level invariant doesn't affect it.  But this is slow, which
>   is what motivated the write() syscall support.
>
> - write(): meant to speed up the userspace-memcpy case above by doing
>   the copy in the kernel.  I believe Brendan's __GFP_UNMAPPED/mermap
>   work [1] would give us a low-overhead way to get temporary kernel
>   access to an AS_NO_DIRECT_MAP.  Landing mermap may take a while, but
>   this series does not introduce the write() path, so mermap is not a
>   blocker for now.
>
> - kvm_gmem_populate(): this is a TDX/SNP-only path, and NO_DIRECT_MAP
>   is not available on those VM types =E2=80=94
>   kvm_arch_gmem_supports_no_direct_map() returns false for
>   KVM_X86_TDX_VM and KVM_X86_SNP_VM, which are its only callers
>   today.  So it doesn't interact with the filemap invariant IIUC.
>

I'm a little bit uncomfortable this statement since it seems to say TDX
and SNP aren't taken care of. Would just like to discuss (for
a line of sight to SNP and TDX support):

For non-in-place population where the source physical page is different
from the destination physical page,

+ TDX: the TDX module does the population and works with physical
  addresses, so no issue with populate? Other parts of TDX may have
  trouble though, but that can be handled later.
+ SNP: sev_gmem_post_populate() does a memcpy() after using
  kmap_local_page()

Would mermap be a drop in replacement for kmap_local_page() here? Would
guest_memfd need to force a TLB flush after mermap+memcpy?

> So, unless I'm missing any path, adopting the filemap-level approach in
> this series should be fine.
>
>
> I'd like to consult with you folks on how to proceed in advance.  In a
> separate reply on the cover letter thread [2], Lorenzo and Sean
> suggested that the mm pieces should go through the mm subsystem:
>
> On Tue, Apr 21, 2026 at 04:36:00PM +0000, Sean Christopherson wrote:
>> Yeah, when the time comes, the mm pieces definitely need to go through t=
he mm
>> tree.  Ideally, I think this would be merged in two separate parts, with=
 all mm
>> changes going through the mm tree, and then the KVM changes through the =
KVM tree
>> using a stable topic branch/tag from Andrew.
>
> I see two reasonable paths to get there, and would appreciate your
> input on which you prefer:
>
> Path A =E2=80=94 validate on KVM side first, then split:
>   - Post v13 as a single series on the KVM list, gather feedback and
>     make sure the design is acceptable to KVM reviewers.
>   - Once v13 looks good ("the time comes"), do the MM/KVM split,
>     rebase the MM part onto the appropriate MM branch, and post the
>     MM part to linux-mm to build consensus with MM maintainers.
>
> Path B =E2=80=94 split early and seek MM consensus in parallel:
>   - With the filemap rework already in place, do the MM/KVM split
>     now and post the MM part to linux-mm directly.  The KVM part follows
>     on top of a stable topic from MM.
>
> Which of the two would you rather see?  Happy to go either way.
>

Vlastimil pointed out that there's a temporary limitation now that the
mm-tree cannot do stable branches shared between trees now.

I think it depends on how quickly you plan to refresh this series, but
Path A wouldn't be blocked by the temporary limitation.

My opinion would be to go ahead with a new revision (Path A) to fully
address comments before splitting the series. Any Reviewed-bys can be
carried over to the split series anyway :)

Alternatively you could wait till conversion lands :P Either one of us
will need to do more work for conversion wrt direct map removal.

>
> [1] https://lore.kernel.org/all/20260320-page_alloc-unmapped-v2-0-28bf1bd=
54f41@google.com/
> [2] https://lore.kernel.org/all/20260506080753.14517-1-itazur@amazon.com/
>
> Takahiro
