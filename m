Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114352;
	b=Uai89jwEHK45mAhj1mHCTERaPHUYb+rPfB1Ft/uRmRrf7mtMfBfsPU3FdUPo4n0rmsVQ
	 OJb/DPUw546AuryfGp9ekGcvYiqLhenfh8t6J4Bch5ZSxF/3KFbyMd1tmQVvzy2//1loq
	 s/YSnSxpEg0YSiXsjzemR6mvIV0zsUAg06V4+WgKiuZSHkeQtwAl9K3gh/QsgROBpxePl
	 mWQX777mpR1FZnFiWwA6etLZRGFDdrvFsCibRDCK1M+07OdVH5Rxp4o5arLdcYM9vI+09
	 E+1v2kP+b0n2rSdphYqTBZch9OS1lcF4ByPrxDezp02mWJUoWiCgBmZ0t0OUPZV8C/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114352;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DMAnc9Xs3KUNlFWK24lYx3EB87h8Uvn2c/RHBGCf0T0=;
	b=csa6Vk61J1rvng0RdzhKWAZlUNx8pbVKG/a3SVzwS0iAWiOrNh2OeNK656hi03msgL8u
	 YjX0O2OSCKVQ9nXZ2Z0GPZYYqXLM23PwkLpDTSLrQ3+YenCoqwKU5iFEJzkMwDuDlrUrX
	 Um/74yRusbIglafOjQK+JddI4i9hg9gZNoJyxC/q02w3v1/6enUDlbs5Cl6wYNSFCXvbr
	 i7WKoaKT446KhIwxNGoPmPFE9otarRW2nGe9cUz3vdGUIaJM7afqmQoOE128gdc36HGmk
	 Smgtl9VqKrsmbh+c3OkGIPFjDt5fb2v+zaOmLiCIUFHLZwdy2iQp16xYx1531ifDvsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mgM1vKkj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC06606A31D
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mgM1vKkj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0881F008BC
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114351;
	bh=DMAnc9Xs3KUNlFWK24lYx3EB87h8Uvn2c/RHBGCf0T0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mgM1vKkjWvnbxg+M64llnEwsiUdt77IDEbiGWMQmQyb8WSiM5PRKMXZEYZ7HHqWS+
	 B3MXncZMF3EkvxTNYx0bijIDEIT/9q1o9j5FIt5fXdW1FJmzs4maXTuc/8n3TzyDaZ
	 Xkcah3DOIrsPoNe/K0qE3XrMPfcjO6CZ4TBn8b13P5AHZtLW27w9zrWYoLLeT++URP
	 VRXPFjMaJwJiQUg4Y+99KxplHjtVlzblBTAVfZUDiI41TUsoNoz2wJpFdSpeSjWDk+
	 1xwAsoX2hQMjxBJ6JUsAQCDSZumzcFqEa8ztimIAPbSE6efH2t6WwJC3lvIBjtKxSI
	 F2wefJtZRekqQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so269815a12.0
        for <loongarch@lists.linux.dev>; Sat, 07 Nov 2026 21:05:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBybAxSDVbYqds9khRD9sGb8kRMFErwo13ESkzruuOrtj61WBlvEWxDIpCTeQAgMo01T4YHk3DCmiF0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QDP7fWfd/R4e4NRqVi/HL4a2mk0itRmtRKlAwGPp94CjD4wpl
	7CMlJKa7pNs3VcEuwE9BfIibOV7rTfokdPERDUuM8Za10H0cFLcCQSkni1VQcCgfEfjSGlrlLI4
	7K+dQMxKaK55CmD627fR8ysc7E6TrhS0=
X-Received: by 2002:a17:906:d550:b0:c4c:e344:ecec with SMTP id
 a640c23a62f3a-c4d6d15a575mr44829966b.6.1794114349578; Sat, 07 Nov 2026
 21:05:49 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016095151.1155049-1-cui.tao@linux.dev>
In-Reply-To: <20261016095151.1155049-1-cui.tao@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 13:05:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ZU1KaagDfObCZFYDTowG5EYf3QpdUebdpBdtozzF00g@mail.gmail.com>
X-Gm-Features: AclHuK_a2jTQjAVHTLhyRW9kDvdj1qOm6NVMjMG_Ua0PORpvn7SJ5WZ1nS5nXwA
Message-ID: <CAAhV-H4ZU1KaagDfObCZFYDTowG5EYf3QpdUebdpBdtozzF00g@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] LoongArch: KVM: irqchip fixes
To: Tao Cui <cui.tao@linux.dev>
Cc: maobibo@loongson.cn, gaosong@loongson.cn, zhaotianrui@loongson.cn, 
	loongarch@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@xen0n.name, nagachaithanya9911@gmail.com, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Fri, Oct 16, 2026 at 5:52=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> Hi,
>
> Three fixes for the LoongArch KVM irqchip code:
>
> - Patch 1 clears the device pointer in the destroy callbacks: when
>   KVM_CREATE_DEVICE succeeds but the following fd allocation fails
>   (e.g. under RLIMIT_NOFILE), ops->destroy() frees the irqchip while
>   kvm->arch.* still points to it.
>
> - Patch 2 aligns kvm_pch_pic_create() with kvm_eiointc_create() by
>   propagating the real error code; the kvm_ipi_create() counterpart is
>   being fixed separately (Chaithanya Lagisetty).
>
> - Patch 3 rejects repeated PCH-PIC CTRL_INIT with -EEXIST, using the
>   initialized state of the kvm_io_device as the indicator.  The check,
>   the MMIO base update and the bus registration are serialized by
>   slots_lock; on a registration failure the state is rolled back so
>   that a retry can start over.
>
> All patches carry Fixes tags.
>
> Changes in v5:
>
> - Patch 3: roll back the base and the device state on registration
>   failure, as suggested by Bibo.
>
> Changes in v4:
>
> - Patch 3: update pch_pic_base unconditionally, as suggested by
>   Huacai.
>
> Changes in v3:
>
> - Drop "Load dmsintc pointer once in pch_msi_set_irq" (v2 patch 2),
>   suggested by Bibo and Huacai.
>
> - Patch 3 (v2 patch 4): reject repeated CTRL_INIT by checking the
>   kvm_io_device state instead of a separate has_init flag, also
>   suggested by Huacai; the check stays under slots_lock.
>
> Changes in v2:
>
> - Drop "Guard against NULL irqchip in irq injection" (v1 patch 2) and
>   "Rebase steal time counter in vcpu context" (v1 patch 4) after
>   review discussion: their trigger scenarios are not reachable
>   through real VMM behaviour.
>
> - Use the one-line destroy style in dmsintc suggested by Bibo.
>
> - Track repeated PCH-PIC CTRL_INIT with a has_init flag and return
>   -EEXIST instead of -EBUSY, also suggested by Bibo; move the check
>   and base update under slots_lock so they are atomic.
>
> - Add READ_ONCE() to the dmsintc pointer loads so the compiler
>   keeps each of them a single load.
>
> Tao Cui (3):
>   LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
>   LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
>   LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT
>
>  arch/loongarch/kvm/intc/dmsintc.c |  1 +
>  arch/loongarch/kvm/intc/eiointc.c |  1 +
>  arch/loongarch/kvm/intc/ipi.c     |  1 +
>  arch/loongarch/kvm/intc/pch_pic.c | 19 +++++++++++++++----
>  4 files changed, 18 insertions(+), 4 deletions(-)
>
> --
> 2.43.0
>
