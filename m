Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A313CF686
	for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 20:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776716192; cv=pass; b=Ap0ef3E8Pa24G+KabiKxKrq664iTRNgMxNFH6TJisPvsBg6zrZppBJIK5pNCoy4OF4Od+G40ajCt3/VXwA6lvEENFZufVGNcBIAqW5QwFCt4vmI+7j1KPd7qyntPfYhtma0/uv4q8UcTAWtr0E/XX2tJksYqCnl8ZyGJ3HfMowE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776716192; c=relaxed/simple;
	bh=T2CbOfZfcHTYTTfWTmb6AIcYZZvXGVpPVSpTlqZSmuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5AEL9lURhTo9XGB6sdqsrr0G6gsYmQyiIVEJEfRfPZXHlV9Fvx8X/MafnuDVSgYHPPhfLzRCzCBW0b8/CsriMLYaqkUtfb1Iz67PwXT4M9UrVi4cwryaKK3sUzQ3YlgYeAACFvwC2mroKeiT3vRgbSTIrySqlESD1DJo5IEC8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vdFMP9o9; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vdFMP9o9"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38dd9f11a09so32600451fa.2
        for <loongarch@lists.linux.dev>; Mon, 20 Apr 2026 13:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776716189; cv=none;
        d=google.com; s=arc-20240605;
        b=c+P8QGbLfhq7/3G0kc6vKmvlNOhYj4uU1QuZQhGGeZhvyMdNTzUHgIfS5Dl6VtGj7l
         UASE1LxDeOFgDkdMnNXeyVLcDFPFXOPpc41RwxtsgzYo/As1bxxLJ6mKsob7EnGpDSta
         QlwByVLjBtYukaQdMLbHNnltRTBZnzxnDJYmLBQskbz8Pu50udfJKNZOavgO600cT9ZL
         UsPx3HbhxI8+X9dFETiYWBml08eF0D0ykNW1jptqJQLlFQHsaWkUoNQ2PZz8OpbUSVVa
         hSXLk+qQuhu6zeizrag5xgjqywv7iBeGX9fDXeEC+ZYmjwIY8IIxjOcopivknBGMf+Na
         zgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        fh=ujV7+PUI/EZ3xyMYNZbwkVyBklaiGQfDLdmdtNP1k00=;
        b=SREYm+eE/NztYEIQFeJWw25paapuGBLex1dhQX0OddRTNuOaaEfaU5yA2LzmcZQFho
         /mQBesARLbT8nh0E62meR0c5oZg+JzUwmgFnKtg6VmBihomfW7hA2KbaQ7UAtPf2yc+x
         dy+3njWvvzM7/UiF/w8UzgTVBZCaPorjpTfd8g79ihMN5fQkUe0KCdzWwfoqnwIO2GFj
         +xwj834XMap6RkSl4Lzr6WK+hK/iE6jTWQKyc/iCdr/K5FeCWrxQ6t5+oNOSAkxIjSc1
         +peu60cmcQN9+LTtelQBnotRLmyTj85lD8YeFnvlGrF7iPzfJVhYa35MNn052t2bnPKO
         dv8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776716189; x=1777320989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=vdFMP9o9BlvCoHOd1TU6eltDl/OtAuhe1lsrk+oGZ9e0CKK+pqM+C8a0aJayJ/a4nO
         DIaZAzJuhEk+09IFDEzc5p861Q+i4P3fOv7TsgwVf2wM/Mq5655vFjRADe3i1xV8JqAR
         RYzxrhJfKMrRRs7iUiUWBlbN6q3GHSs/XVJuSE3/ARc90ItI2v94YKczl2BuzSFhAMuV
         UVVmUH0br6zwPYec5kFgZM653tlsDrY5nKZ4RYXMKdopfhvz8/IYjL4BJyYOAM34piE7
         KJ6SHIE8mpQZ2FhjXqAVCp4dBj1t7DnT0CZy4vm2pZbgaj/xLewRNlouHTlELI35FjWr
         Uu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776716189; x=1777320989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uT/kFgtDJcz1r8Wwv13r6DbOoiLv2w0cC+Hfy6lE6eQ=;
        b=dMmR3WtPKnvcplensfqCDhhC5HWlQ6XhvA1gr6L42M8MpEvEoAJc6xmXDMzd9dc+GX
         p0cmLs5oHfa6NKrcY69ViAROdCvrrWRz+Y41oxXuKvxuvhW5c5EniK6PigyLYZJHnJR2
         1q3TssNR6lJV1iS/bFEMdXAjQloZF3MELSUp4J+ULNrsfho2bhsLdeuXnM6drNiNH+JY
         Pk6JPfHhTDp83icm4jl2NxeH8fxFCSgiNXdVcftM6Pj/Lmmk+tFEU3I+V53CvwgOutGt
         vXFouh3ZJv/yenVwoH9SlKy89bVPi4QcZada83pcqy57JVT3YaMZ4kvP507VREHOvpiu
         6WbA==
X-Forwarded-Encrypted: i=1; AFNElJ8Cnf+hj6wPtlq/NJ1OnLrxqDHpLCsa8oR1B7vP5fc3xNh+8+gPotB5kRYkNa5lfo7vt5oPXoF83cM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCibZbNmY9JjBSt6mQq4ZSb0oQncGQGVm/Kl4HaY8yj7hLkfwb
	3GxKQgZhWpeP29Rb9HbrpTsjsyynMJryrorGI3wmvR6PkvYmtzIobzZcU7OVil9dTCPZc+IEYnu
	zMnlbBA0x7c2wlIHLNBfq2Y5nTWRR3Vhjyx7teR7R
X-Gm-Gg: AeBDietj9WD0LjHhRgvqu+TwN2hRQdclLi7ZgMHYXaEYGPC8ExuAvdWQbnhxa7U6I+y
	+NMTv0Ra/aB03zZfVSqzclxC0HmlgT4VqAI76JsMjbhMQaqBjRC38JvKFtEZSEMnkTkxbWWQU1I
	18P1dgahEIzCPNfFYY5grjHMBOTq0+FQAcOwX+fUF+w9pQ8RErX3szWwfqCeB3CHTginotq+CQZ
	YHnVsh3DydAKXVvXPDO6gZUvYD7DhGkFE8qhg/LjkPACWypc1Uqunevgl/yX4RPMO/u5Cyr5Lko
	RXemPEXdYxQ3g+yDYAkcSmrx2CnB7itIVRa+jeJs
X-Received: by 2002:a05:651c:400e:b0:38e:76c2:dc8f with SMTP id
 38308e7fff4ca-38ec7ae0487mr32714001fa.25.1776716188389; Mon, 20 Apr 2026
 13:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-2-dmatlack@google.com>
 <aeaHPYwzs0dhwX9-@google.com>
In-Reply-To: <aeaHPYwzs0dhwX9-@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Apr 2026 13:15:59 -0700
X-Gm-Features: AQROBzA7QaU-uTclKNPqPjm7N83BGZYqy9MhPcyoyTd2bRZSTk_SV3WPxct_hj8
Message-ID: <CALzav=dvNr2s3UzDKPyxS3JUcaWykKNvYPJUW+8g21DA9SzJLw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] KVM: selftests: Use gva_t instead of vm_vaddr_t
To: Sean Christopherson <seanjc@google.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 1:06=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > Replace all occurrences of vm_vaddr_t with gva_t to align with KVM code
> > and with the conversion helpers (e.g. addr_gva2hva()). Also replace
> > vm_vaddr in function names with gva to align with the new type name.
>
> ...
>
> > @@ -716,22 +716,22 @@ void vm_mem_region_move(struct kvm_vm *vm, uint32=
_t slot, uint64_t new_gpa);
> >  void vm_mem_region_delete(struct kvm_vm *vm, uint32_t slot);
> >  struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id);
> >  void vm_populate_vaddr_bitmap(struct kvm_vm *vm);
> > -vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_=
t vaddr_min);
> > -vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vad=
dr_min);
> > -vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t v=
addr_min,
> > -                         enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
> > -                              vm_vaddr_t vaddr_min,
> > -                              enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
> > -vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
> > -                              enum kvm_mem_region_type type);
> > -vm_vaddr_t vm_vaddr_alloc_page(struct kvm_vm *vm);
> > +gva_t gva_unused_gap(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> > +gva_t gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min);
> > +gva_t __gva_alloc(struct kvm_vm *vm, size_t sz, gva_t vaddr_min,
> > +               enum kvm_mem_region_type type);
> > +gva_t gva_alloc_shared(struct kvm_vm *vm, size_t sz,
> > +                    gva_t vaddr_min,
> > +                    enum kvm_mem_region_type type);
> > +gva_t gva_alloc_pages(struct kvm_vm *vm, int nr_pages);
> > +gva_t __gva_alloc_page(struct kvm_vm *vm,
> > +                    enum kvm_mem_region_type type);
> > +gva_t gva_alloc_page(struct kvm_vm *vm);
>
> The existing vm_vaddr_alloc() and friends are pretty bad names.  gva_allo=
c() is
> far, far worse.  The APIs aren't just allocation a guest virtual address,=
 they're
> allocating guest physical memory, finding a usable virtual address, and c=
reating
> mappings.
>
> I don't see any reason to have vaddr or gva in the name.  E.g. malloc() i=
sn't
> virt_malloc().  But I do think they need to be explicitly scoped to KVM, =
and to
> a VM.  I'll drop API renames from this patch, and rename them to vm_alloc=
() and
> friends in a separate patch.  Amusingly, that naming scheme will still wo=
rk if
> "vm" is misconstrued as "virtual memory" instead of "virtual machine".

Sounds good to me.

> P.S. This is a great example of why I insist on one logical change per pa=
tch, with
> judicious exemptions for opportunistic cleanups/changes.  If this has bee=
n a
> separate patch, it would have taken me all of two seconds to unwind.  As =
it was,
> I spent a good 10-15 minutes dealing with this.  In large part because I =
kept
> making goofs, but that's the whole point: there was no reason to put me i=
n a
> position to make goofs.
>
> The other argument against these sorts of "Also do xyz" add-ons is that o=
f a
> slippery slope.  Why rename these APIs in this patch, but not the myriad =
vaddr
> variables?  Then after a few "I'll just clean this up too" changes, there=
's an
> entire series in what is purportedly just a typedef rename.

You're right, the API rename should have been split off into its own patch.
Thanks for the guidance!
