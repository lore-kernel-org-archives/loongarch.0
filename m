Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141A150997
	for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715585; cv=none; b=l7H4qHLRFLuTKPVTZR9puJDKquP2hWEXyIopB6NBJT14gJO01KvlXT4IavKHWfP+K85r0rT21BNCLVZhJ7KFYzKRREj67p4SBVJ4nfT88EHLWGzvcFG4gSPND0t4EbrvSmdQXPIUTNjiBLn84IZSkvmcu9wVVDECGkZUpCoMEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715585; c=relaxed/simple;
	bh=b89JOdWc2tHnz0JBm0XSYjGwA2IuoPpOvjwTZ1/Lux0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bkrXD82KPdILc8QX7TCP2uqm4QzkbUXEyMRPI388AClUIh6BFTzHBWONWaESkOBMf9tyqf+8BRK8AKijadTEXxRY29HjzwP/hKeBQdZr8bQkPh1wObWFXlMZmwQ1P7lkdBzdstfOe4OXUGw5P2tu5mnlMhMaVUkue8fE0kwe8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YiOg2IZw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YiOg2IZw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35e59791605so3393592a91.1
        for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 13:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776715583; x=1777320383; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=YiOg2IZwECi4JjZYtAuxAV14MYNvGcVz1aHoE8x+Za/ECgqn1EogsMh3Vtecw2M8FG
         7jfWfAt2CclzIE0GZe7Il3Jpfg5WFlxqZVrDpsX2HqQFz1/+FsKU7mRFBOsnWsyh1A2U
         /1Scf2m3+E9WaEMu73LNWrd0yO6CbW6gzX5f4h5uBBJVRqjFp7SqzdmTKyKCcn2YPwwi
         iH4h7TEgvOGmebZgH92HGH7fVZK7IZbKpWtBQmGvA3yp5bMLs/px80BtGcQeIaIY2D6p
         hKF86jsPMqLnkOWHXyaOh8CWP/FwFvmCDW7VBrV/4qpH97yEf12HvHVTwL3L5pASIHKD
         HC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776715583; x=1777320383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZxYUqD2nNuvPN56vUHQyfWGRkh1zwfXr7oE1wyS0SA=;
        b=TjoEsM1+DArJlZYrVJwmSvreqs2Cs1x4oNIKuboFCBr7Do/X+VRxc18f+0mUPMG6ko
         Hqu8T51RXXMXHw4iPfsm1NJg6hxw+4U93pwNpZhAdgVa5jm6bAAFKVWkg1bFDqo9m5rH
         1/ZpvlK+bLFJJlBnIdy1pkjDJNiZ8Vb9ZTacZ/DxVoTDPUSspidPvWWe4gy6Rd7VhjVP
         oQE/LlwnggxGNrmBORzdx9ya54OCckWwRFZlJqCf84hmgKsNQWXndmluX6tNmydNuBVM
         sHhvP+tMVjeVHRT3gRX8X662Hx6bsJ5VEx/aRDYoybeUgBcX/oF9u16cENLKFxRDHTqw
         7Tlg==
X-Forwarded-Encrypted: i=1; AFNElJ99df2EwuCyqTFGwDX5NlsJr5ZUyHwO4OYdfJuf+3HeIYcjH6ozA+yTtKFRoHI0xEy1nAKQ7FrfQ9A=@lists.linux.dev
X-Gm-Message-State: AOJu0YycdXZUNIUnbLlrTCbnzVnW7blEtiiyvYmMovl3uLoF45gURJcj
	VAKdLjLg/iqSL52kX03+JNHeD5Xsx4H+12xDDJXPsdwdKIybmh5tDrbg8v2B4W8PtCV9K+ukivu
	gWdl9OQ==
X-Received: from pjbkx16.prod.google.com ([2002:a17:90b:2290:b0:35f:c299:a451])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164a:b0:35b:96bb:47ba
 with SMTP id 98e67ed59e1d1-361404c0ca8mr14786253a91.26.1776715583185; Mon, 20
 Apr 2026 13:06:23 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:06:21 -0700
In-Reply-To: <20260220004223.4168331-2-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
Message-ID: <aeaHPYwzs0dhwX9-@google.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 20, 2026, David Matlack wrote:
> Replace all occurrences of vm_vaddr_t with gva_t to align with KVM code
> and with the conversion helpers (e.g. addr_gva2hva()). Also replace
> vm_vaddr in function names with gva to align with the new type name.

...

> @@ -716,22 +716,22 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
>  void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
>  struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
>  void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
> -vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
> -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
> -			    enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> -				 vm_vaddr_t vaddr_min,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
> -vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
> -				 enum kvm_mem_region_type type);
> -vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm);
> +gva_t gva_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> +gva_t __gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
> +		  enum kvm_mem_region_type type);
> +gva_t gva_alloc_shared(struct kvm_vm *vm, size_t sz,
> +		       gva_t vaddr_min,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_pages(struct kvm_vm *vm, int nr_pages);
> +gva_t __gva_alloc_page(struct kvm_vm *vm,
> +		       enum kvm_mem_region_type type);
> +gva_t gva_alloc_page(struct kvm_vm *vm);

The existing vm_vaddr_alloc() and friends are pretty bad names.  gva_alloc() is
far, far worse.  The APIs aren't just allocation a guest virtual address, they're
allocating guest physical memory, finding a usable virtual address, and creating
mappings.

I don't see any reason to have vaddr or gva in the name.  E.g. malloc() isn't
virt_malloc().  But I do think they need to be explicitly scoped to KVM, and to
a VM.  I'll drop API renames from this patch, and rename them to vm_alloc() and
friends in a separate patch.  Amusingly, that naming scheme will still work if
"vm" is misconstrued as "virtual memory" instead of "virtual machine".

P.S. This is a great example of why I insist on one logical change per patch, with
judicious exemptions for opportunistic cleanups/changes.  If this has been a
separate patch, it would have taken me all of two seconds to unwind.  As it was,
I spent a good 10-15 minutes dealing with this.  In large part because I kept
making goofs, but that's the whole point: there was no reason to put me in a
position to make goofs.

The other argument against these sorts of "Also do xyz" add-ons is that of a
slippery slope.  Why rename these APIs in this patch, but not the myriad vaddr
variables?  Then after a few "I'll just clean this up too" changes, there's an
entire series in what is purportedly just a typedef rename.
