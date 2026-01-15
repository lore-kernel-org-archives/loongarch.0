Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4C322DB7
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507239; cv=pass; b=LLuAQcrgoOTtRkQPkGTjcmXCHmufUlELYuZozL9A3y4oj84GFA7AQLtEV9w5JjtDUA9Bz1rAcDMOWYC/3OOMM5oBrEurYPyj9UgFez4yGL7w7TjDrSPRRRSzuYrTmMnDBG3vMBgOj8uUJq32gyEgkVAjYOf3FSlRNXR0K9238lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507239; c=relaxed/simple;
	bh=3IXgkJInwQFfA9G8yI7hxvXB7fDIhmfIJ/TWmwX1f+I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsUzIHTgH7bw0mulp2xu70r3scRHQ/aHhfibr3ZjSRykKzBqjfbgiclXzBOoNua4v9LSQ5NCm/wZ3yevOy/5Ue8DoXEQ9vwrdFQqTwCzyHzf6TUGHSprVb37QZxe2FgCozM1eEDOCJ2J7tXd+uOVucWxxjkQZXyKrGcjGCBt+yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CLN55Vh5; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CLN55Vh5"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so1370770e87.1
        for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 12:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768507234; cv=none;
        d=google.com; s=arc-20240605;
        b=V7BAO44KdqOMA7CqKi8ozmkYCuZm6cmATJT1XutzOFgzqYD42dLvrjV/jqGo2OVCxp
         Nksy9w9/StEGTd1H0rF7bRk/OEY2oi4u4cFlrtTIVbrg1X+szFuYUItW4hT2mWgVVnDS
         /3R6ZDgue1jCWNfsyWSiRckXxp95iYqQdiIJ9otSQkXTRNQajOFvwxuLM1r2T0MVrycE
         zRXsOJkw/5xT0JG1lpg2JSxa/WdNe/54w6jvoGWtIQSKdVZ5WfyYjfR363X40QQilciu
         R18ZQ1dXlnioImo5FEHNPVrCErVxuHX1bf1B+RMGtR9WFbWJmAMVDf/O2b6ReJ+RCFzU
         oY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=qj8h6BORpJwq1gCbueilyNjyLieLucwDic0ANZ8jZ4g=;
        fh=HEo3HQVKrEBgWzPf0GSqElmHsVjaxHjiwQxERpro/Ag=;
        b=bjORFzCrcGcvmBtzla8tyztDn8lCFwE7WyuLlilBX/oq0NlJwbFwWXR3eLi+eCazWw
         wgY/Ixk9BPdG/o+cOOohQ8XRArUM8X00tfYVgHBjgJfOp3tX5A0EA3RMqDmO7XIYtf5d
         kjMf5KEOaUbXer7dsS0gRCl1zzFBoFCIBdmnR0lgYqzheVC+DTjLc4iFAX1BrAr3X16i
         AAQP28wqPzzYQ6AQnliSxBYzxqjXlUogPCYh3UmWww3izrjgM82mobXhBiVGOK8kT2n9
         8pClXIWFZ2tyjLMRH0o03D8udM+gVSRWoJNidI19yI/PsoIqFpgMdgDgue9bPZaWdeVJ
         OwaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768507234; x=1769112034; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qj8h6BORpJwq1gCbueilyNjyLieLucwDic0ANZ8jZ4g=;
        b=CLN55Vh5fsUxfsGbmO/p1+2wXv3jciCFHq062JW3Fv2eCBMdZSKVXoU5tipTj9WBp9
         omMf5PS7cIkLnnThpfMzDiF4UKOcuJ4PqLxUHme9MebODkyd0Y8Mu7sbugWFq3CqG6nt
         B1zB2Qzn7kxyALJHX2Ymmd1lTyaYJuT2+hyjhrWUK5m4hYQEyhD250oNR8BEu1D354JU
         wDa+Bdr8T4Gq3Bxwzofr9+3Kf+B9j5+wd9sVoWTBtWos5tARjQ6GRLscbqK0KoUnMule
         KYbjNM31mkZnQr1ArAkYG0457lcCI3VWz3xa6WmZ4fjCQ2b0h7zQAOBYEPuD0sx4L9lg
         j+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507234; x=1769112034;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj8h6BORpJwq1gCbueilyNjyLieLucwDic0ANZ8jZ4g=;
        b=AyIVBkAZsNwffqnTg2GUxWJzQob9HC+D9sFUDLwrxou/assupUfPmmaJopmFbfjTDb
         zVRPVWfi+dCWDZi+p59UTcjiRFCi22kSjQwN0R2jBNvtcP5eYukTVn/K8MkUMUvDKITl
         7Hrh3r1p8xh63nku9t0Z39Gm0dk9+x5scOMscHyn0Ou8jXcAm1OSQ+k76c/Hws81MkpN
         sZpUfvqHpuq2sswTsdrPmwsLwVxLdYTRwFS6ML4/aftdf3ztlPKVOwMNUfc84+WqrIhI
         /jkQR1yMkILic/zV+yqzibhavwEROQFlEp9kvgSLujwHHjv91a0fZrstV/zdm3lALQOf
         GIAg==
X-Forwarded-Encrypted: i=1; AJvYcCW6vS7YPXQN/P3bcV1S7qe/B1Yvtqv6LtERVA2S/CE3BT0ezEz+Ir3BnQboFIe2I7TfmnENNnIyzrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLmL4movOxmHm1qWpymkEnzE65/XseFm+xjNIbL/92g9aqJfSW
	Do9LyJK7IZdBz4013rcfBsR1AQmA/o6nNmekvy76QRk1dp/kDAwjghow/0oZ/bdARDCvVny898w
	jhwvalw+mbEvptNWgSZuT+vgiy8aNeFi1Ra3vPar+
X-Gm-Gg: AY/fxX7vKQcHsfq+ukR+QorECIikI6nc8WiX/9RBzx1/QitqTjac6xBb3WSgFzJCENV
	EH0DbKuKYiojD4hCs02AuqqQzsnomOxcDXVm4S5DNpIaeWOY0aNwRoRzNOT9KDU31rHkeWhw03h
	23JoMdLdYiZwPLHsF0ATqYcZMvn2xLIzPL39vjV46ps3tqeiqO/cqxPCHjwS6HD2W6H/IXcPDM9
	XCYFQVn24cMbhLDalYvSlO8I4opN02cjecqrv3tLkYy5C3ze7GDuJ07KiRJg3lQsd3ObLSN9k9s
	+BBfwY/qYcRqJB2FyEKNCfGAaA==
X-Received: by 2002:ac2:51c8:0:b0:596:9bfa:91a4 with SMTP id
 2adb3069b0e04-59baeec5ba2mr223831e87.2.1768507233115; Thu, 15 Jan 2026
 12:00:33 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 12:00:31 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 12:00:30 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-8-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 12:00:30 -0800
X-Gm-Features: AZwV_QjBsd3lTOri7HGHELmcazvDzXzFF30pFq7CI4dK0BruDZK-2GmBwhNuHRw
Message-ID: <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Patrick Roy <patrick.roy@linux.dev>
>
> Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
> ioctl. When set, guest_memfd folios will be removed from the direct map
> after preparation, with direct map entries only restored when the folios
> are freed.
>
> To ensure these folios do not end up in places where the kernel cannot
> deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
> address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.
>
> Note that this flag causes removal of direct map entries for all
> guest_memfd folios independent of whether they are "shared" or "private"
> (although current guest_memfd only supports either all folios in the
> "shared" state, or all folios in the "private" state if
> GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map
> entries of also the shared parts of guest_memfd are a special type of
> non-CoCo VM where, host userspace is trusted to have access to all of
> guest memory, but where Spectre-style transient execution attacks
> through the host kernel's direct map should still be mitigated.  In this
> setup, KVM retains access to guest memory via userspace mappings of
> guest_memfd, which are reflected back into KVM's memslots via
> userspace_addr. This is needed for things like MMIO emulation on x86_64
> to work.
>
> Direct map entries are zapped right before guest or userspace mappings
> of gmem folios are set up, e.g. in kvm_gmem_fault_user_mapping() or
> kvm_gmem_get_pfn() [called from the KVM MMU code]. The only place where
> a gmem folio can be allocated without being mapped anywhere is
> kvm_gmem_populate(), where handling potential failures of direct map
> removal is not possible (by the time direct map removal is attempted,
> the folio is already marked as prepared, meaning attempting to re-try
> kvm_gmem_populate() would just result in -EEXIST without fixing up the
> direct map state). These folios are then removed form the direct map
> upon kvm_gmem_get_pfn(), e.g. when they are mapped into the guest later.
>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  Documentation/virt/kvm/api.rst | 22 ++++++++------
>  include/linux/kvm_host.h       | 12 ++++++++
>  include/uapi/linux/kvm.h       |  1 +
>  virt/kvm/guest_memfd.c         | 54 ++++++++++++++++++++++++++++++++++
>  4 files changed, 80 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..c5f54f1370c8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6440,15 +6440,19 @@ a single guest_memfd file, but the bound ranges must not overlap).
>  The capability KVM_CAP_GUEST_MEMFD_FLAGS enumerates the `flags` that can be
>  specified via KVM_CREATE_GUEST_MEMFD.  Currently defined flags:
>
> -  ============================ ================================================
> -  GUEST_MEMFD_FLAG_MMAP        Enable using mmap() on the guest_memfd file
> -                               descriptor.
> -  GUEST_MEMFD_FLAG_INIT_SHARED Make all memory in the file shared during
> -                               KVM_CREATE_GUEST_MEMFD (memory files created
> -                               without INIT_SHARED will be marked private).
> -                               Shared memory can be faulted into host userspace
> -                               page tables. Private memory cannot.
> -  ============================ ================================================
> +  ============================== ================================================
> +  GUEST_MEMFD_FLAG_MMAP          Enable using mmap() on the guest_memfd file
> +                                 descriptor.
> +  GUEST_MEMFD_FLAG_INIT_SHARED   Make all memory in the file shared during
> +                                 KVM_CREATE_GUEST_MEMFD (memory files created
> +                                 without INIT_SHARED will be marked private).
> +                                 Shared memory can be faulted into host userspace
> +                                 page tables. Private memory cannot.
> +  GUEST_MEMFD_FLAG_NO_DIRECT_MAP The guest_memfd instance will behave similarly
> +                                 to memfd_secret, and unmaps the memory backing

Perhaps the reference to memfd_secret can be dropped to avoid anyone
assuming further similarities between guest_memfd and memfd_secret. This
could just say that "The guest_memfd instance will unmap the memory
backing it from the kernel's address space...".

> +                                 it from the kernel's address space before
> +                                 being passed off to userspace or the guest.
> +  ============================== ================================================
>
>  When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>  guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 27796a09d29b..d4d5306075bf 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -738,10 +738,22 @@ static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
>  	if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
>  		flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
>
> +	if (kvm_arch_gmem_supports_no_direct_map())
> +		flags |= GUEST_MEMFD_FLAG_NO_DIRECT_MAP;
> +
>  	return flags;
>  }
>  #endif
>
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +#ifndef kvm_arch_gmem_supports_no_direct_map
> +static inline bool kvm_arch_gmem_supports_no_direct_map(void)
> +{
> +	return false;
> +}
> +#endif
> +#endif /* CONFIG_KVM_GUEST_MEMFD */
> +
>  #ifndef kvm_arch_has_readonly_mem
>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  {
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..60341e1ba1be 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1612,6 +1612,7 @@ struct kvm_memory_attributes {
>  #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
>  #define GUEST_MEMFD_FLAG_MMAP		(1ULL << 0)
>  #define GUEST_MEMFD_FLAG_INIT_SHARED	(1ULL << 1)
> +#define GUEST_MEMFD_FLAG_NO_DIRECT_MAP	(1ULL << 2)
>
>  struct kvm_create_guest_memfd {
>  	__u64 size;
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 92e7f8c1f303..43f64c11467a 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -7,6 +7,9 @@
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> +#include <linux/set_memory.h>
> +
> +#include <asm/tlbflush.h>
>
>  #include "kvm_mm.h"
>
> @@ -76,6 +79,43 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slo
>  	return 0;
>  }
>
> +#define KVM_GMEM_FOLIO_NO_DIRECT_MAP BIT(0)
> +
> +static bool kvm_gmem_folio_no_direct_map(struct folio *folio)
> +{
> +	return ((u64) folio->private) & KVM_GMEM_FOLIO_NO_DIRECT_MAP;

Nit: I think there shouldn't be a space between (u64) and what's being casted.

> +}
> +
> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
> +{
> +	u64 gmem_flags = GMEM_I(folio_inode(folio))->flags;
> +	int r = 0;
> +
> +	if (kvm_gmem_folio_no_direct_map(folio) || !(gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP))
> +		goto out;
> +
> +	folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
> +	r = folio_zap_direct_map(folio);
> +
> +out:
> +	return r;
> +}
> +
> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
> +{
> +	/*
> +	 * Direct map restoration cannot fail, as the only error condition
> +	 * for direct map manipulation is failure to allocate page tables
> +	 * when splitting huge pages, but this split would have already
> +	 * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().
> +	 * Thus folio_restore_direct_map() here only updates prot bits.
> +	 */

Thanks for this comment :)

> +	if (kvm_gmem_folio_no_direct_map(folio)) {
> +		WARN_ON_ONCE(folio_restore_direct_map(folio));
> +		folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
> +	}
> +}
> +
>  static inline void kvm_gmem_mark_prepared(struct folio *folio)
>  {
>  	folio_mark_uptodate(folio);
> @@ -398,6 +438,7 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct folio *folio;
>  	vm_fault_t ret = VM_FAULT_LOCKED;
> +	int err;
>
>  	if (((loff_t)vmf->pgoff << PAGE_SHIFT) >= i_size_read(inode))
>  		return VM_FAULT_SIGBUS;
> @@ -423,6 +464,12 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>  		kvm_gmem_mark_prepared(folio);
>  	}
>
> +	err = kvm_gmem_folio_zap_direct_map(folio);

Perhaps the check for gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP should
be done here before making the call to kvm_gmem_folio_zap_direct_map()
to make it more obvious that zapping is conditional.

Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
this call can be completely removed by the compiler if it wasn't
compiled in.

The kvm_gmem_folio_no_direct_map() check should probably remain in
kvm_gmem_folio_zap_direct_map() since that's a "if already zapped, don't
zap again" check.

> +	if (err) {
> +		ret = vmf_error(err);
> +		goto out_folio;
> +	}
> +
>  	vmf->page = folio_file_page(folio, vmf->pgoff);
>
>  out_folio:
> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>  	kvm_pfn_t pfn = page_to_pfn(page);
>  	int order = folio_order(folio);
>
> +	kvm_gmem_folio_restore_direct_map(folio);
> +

I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
the caller or within kvm_gmem_folio_restore_direct_map(), since this
time it's a folio-specific property being checked.

Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
this call can be completely removed by the compiler if it wasn't
compiled in. IIUC whether the check is added in the caller or within
kvm_gmem_folio_restore_direct_map() the call can still be elided.

>  	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>  }
>
> @@ -596,6 +645,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>  	/* Unmovable mappings are supposed to be marked unevictable as well. */
>  	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>
> +	if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
> +		mapping_set_no_direct_map(inode->i_mapping);
> +
>  	GMEM_I(inode)->flags = flags;
>
>  	file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
> @@ -807,6 +859,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	if (!is_prepared)
>  		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>
> +	kvm_gmem_folio_zap_direct_map(folio);
> +

Is there a reason why errors are not handled when faulting private memory?

>  	folio_unlock(folio);
>
>  	if (!r)
> --
> 2.50.1
