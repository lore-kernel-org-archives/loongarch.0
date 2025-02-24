Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10B1C8602
	for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 23:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740441347; cv=none; b=NoeYgaxitcaXcUVHOOaulKKK7LxIBDtHVErC2jf2yTSsyTWVwxElkmFXvdDCVvCMstEyw/EUH0QlNQi4xyy9x6u7YrHvoeg1EsCthlyL5sM5g3N2sDGV8gux0Avhki9VkRkWdMtAgtmLqAOhReFaFAqX7uNLcGvg9sR3MFCp2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740441347; c=relaxed/simple;
	bh=fpVjeXd5rg+V58pvlPmJutDsFmmNiVg4yf0bC+o5Rnk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VqegLohUkaKbKvaQRqwAoq5HB+SyUShHOQNdGmXj4NWOUpeGX/SIFbGBc4Bf3oaFz20H2DsJ2rTIHkoHwmfXW2aN2hqz1icjDnTpkn0tDhjiYqYd/Srn/cio9wVnlTNaVLqDTOVo6l5ELIx7jLnbvfaiFh2mbVEPhXQh1vuWxS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CwYEWALl; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CwYEWALl"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so10760990a91.1
        for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441345; x=1741046145; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4yv5E3Df19Io1ieaPGo0Ai9BtJpUzyQSBdyF3aMs18=;
        b=CwYEWALlDCmZvP7D4YkiKY//1HvpXSxPmlDgm09AA1o9tbBfCUxrwlqjcruHoJLXnS
         wBi/PLD1wKPwPKHfo5XksfEtXn9hjRyTb0G8IJ8HmqVrTZqLsqagHWtxNaP+GeNyzYV3
         750+MJR1baB2v0IzKB6Iq2Ymzsf2qNQcaEj2x62laxAIpfs+FQ9P3hyOACr/LMPH68aQ
         ckioDDSgSWSeaYpomATsygs31jr4GChkrly1YYrvktnrno2HRxxwGTM8IXTpABu90Wo1
         wOR3vF5KjMxxVtqaOBHzFMj4CMHENidcShIMV+MR/KUxmAyQoEZ2IEBKA9YwXOyIXWMA
         NTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441345; x=1741046145;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4yv5E3Df19Io1ieaPGo0Ai9BtJpUzyQSBdyF3aMs18=;
        b=nWqoLGvuULgskZx7+eDLRVPx4kk1vEboVlfbHy5fyMJjC+aiQXL2hQOe1dSpaT9RTS
         HG4yAJ+zKlB+80eXjFvpE68EmNtAjvlQy7DpU7Y13ye/SocfR4viLbQnPoHTbMR6rgRe
         h63AdNLuLTa8DVbqo8xvxieTgn4+aV5H3KgR+rIiVO3qXP3lYFvxl19T1LgBANPxDgMw
         esaNg9dt6bQc5HIWGlEKW060L0MBE0NmNNn+zJ7ZuFMBC3Po4AsbK3sVGCLMmlirt8mn
         OjRFNK3NdM9aCwc/5ZoxegKLC45OX9sq68woG9bmpS4fk72DmeTFKqp3uBSCy5OQR4kk
         BJmg==
X-Forwarded-Encrypted: i=1; AJvYcCXS/xTt34nRSTYNpIVTNSH6PQTpkLj3v78SRzpIEmys6vazHAuDRQfISDqW6fF6ejTBedIda/b52SM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw54KUKAMUq3FWf9X9bCOJIeeNbu7yYxRa0inYBgYY+4hC2Q+tE
	nO+ABKZtvguiLBfdyVu05rfbOB1FMUpg0pIgwqEMwe+Vmaa+O59D19LmeVGE4Nt15hO9TyOVJhw
	Y9g==
X-Google-Smtp-Source: AGHT+IF6C3DtzvfIloHEkiuLmfsYJNF5ywoI3G+Dg7xZ6ws28dsFaD6h16rXeHiPC/2N2WbxQdNYNz9BqGc=
X-Received: from pjbsd8.prod.google.com ([2002:a17:90b:5148:b0:2ea:5613:4d5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5292:b0:2ee:7c65:ae8e
 with SMTP id 98e67ed59e1d1-2fce77a638fmr26853663a91.11.1740441345356; Mon, 24
 Feb 2025 15:55:45 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:35 -0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-1-seanjc@google.com>
Subject: [PATCH 0/7] KVM: x86: nVMX IRQ fix and VM teardown cleanups
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"

This was _supposed_ to be a tiny one-off patch to fix a nVMX bug where KVM
fails to detect that, after nested VM-Exit, L1 has a pending IRQ (or NMI).
But because x86's nested teardown flows are garbage (KVM simply forces a
nested VM-Exit to put the vCPU back into L1), that simple fix snowballed.

The immediate issue is that checking for a pending interrupt accesses the
legacy PIC, and x86's kvm_arch_destroy_vm() currently frees the PIC before
destroying vCPUs, i.e. checking for IRQs during the forced nested VM-Exit
results in a NULL pointer deref (or use-after-free if KVM didn't nullify
the PIC pointer).  That's patch 1.

Patch 2 is the original nVMX fix.

The remaining patches attempt to bring a bit of sanity to x86's VM
teardown code, which has accumulated a lot of cruft over the years.  E.g.
KVM currently unloads each vCPU's MMUs in a separate operation from
destroying vCPUs, all because when guest SMP support was added, KVM had a
kludgy MMU teardown flow that broken when a VM had more than one 1 vCPU.
And that oddity lived on, for 18 years...

Sean Christopherson (7):
  KVM: x86: Free vCPUs before freeing VM state
  KVM: nVMX: Process events on nested VM-Exit if injectable IRQ or NMI
    is pending
  KVM: Assert that a destroyed/freed vCPU is no longer visible
  KVM: x86: Don't load/put vCPU when unloading its MMU during teardown
  KVM: x86: Unload MMUs during vCPU destruction, not before
  KVM: x86: Fold guts of kvm_arch_sync_events() into
    kvm_arch_pre_destroy_vm()
  KVM: Drop kvm_arch_sync_events() now that all implementations are nops

 arch/arm64/include/asm/kvm_host.h     |  2 --
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/mips/include/asm/kvm_host.h      |  1 -
 arch/powerpc/include/asm/kvm_host.h   |  1 -
 arch/riscv/include/asm/kvm_host.h     |  2 --
 arch/s390/include/asm/kvm_host.h      |  1 -
 arch/x86/kvm/vmx/nested.c             | 11 +++++++
 arch/x86/kvm/x86.c                    | 42 ++++++++++-----------------
 include/linux/kvm_host.h              |  1 -
 virt/kvm/kvm_main.c                   |  9 +++++-
 10 files changed, 34 insertions(+), 37 deletions(-)


base-commit: fed48e2967f402f561d80075a20c5c9e16866e53
-- 
2.48.1.658.g4767266eb4-goog

