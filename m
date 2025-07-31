Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F4101EE;
	Thu, 31 Jul 2025 17:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753984619; cv=none; b=iVhsA6EHOpnYV5bifQo3mH8wfrFj+KjQxAkTB6JYX17+tSYdwtftR0WKsO9spV+D/g2K8fClgEwzq9gh0xWTe/+R+92byboDg4oyjkjWpvwohUxVGb2/ka8NtoM8eKtxGakp3hlMlE18Q48e4yLsHTAullSMtZnIXUaGHB19A9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753984619; c=relaxed/simple;
	bh=UTAAwnNkZ8F8gFc4HNTNbB9l77CKuJmWmx5EcGTJ0SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VTa0DABrZzBH0usONpux6quKm96eXBUDmPcwTjuaHkGnC6DMu0LVWCI4ETLmIg7w0ttOinmjH3GU7b3zFXxHpV37W47FbJN0EKJQZkaUV/16IE7JzONbU2Je6FonHdr7YNf82jOS1QHq8RMHcHuSe45RBulHgiq3g4ovxx0oUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1U5NX3+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1U5NX3+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2E9C4CEEF;
	Thu, 31 Jul 2025 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753984619;
	bh=UTAAwnNkZ8F8gFc4HNTNbB9l77CKuJmWmx5EcGTJ0SA=;
	h=Date:From:To:Cc:Subject:From;
	b=O1U5NX3+T768JIi9YNuGY1AHv+77UKb4rM6WeyA7nw28hqUkxIbzsJi5WiPKQ1Y/e
	 30bRBti4XPZ3sOslwVn5E670UioHqY7DxkpPIRW9CXHU+Nfr5eQjV0+vMT9VsCr8my
	 EvYbKD1n+qEsO/Yr1Khy3nB9r7QdRG+QD9W97HIoI9RWwAK7WYfzRYU07g09uaZq8q
	 u5RuCYztXU+q6z6j+Qew4Q1jCIlEKR63vCI+NmaLQ77vOW86m54uOCLYDDFfam3UbK
	 fIU6nhF88k/l9zUDOdd7Dzfbr+9znN4REj5NFjdtcbPqqvzBsyetQEYuS2TXlmHMZg
	 Bwcfdl7LfqYMA==
Date: Thu, 31 Jul 2025 10:56:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	WANG Rui <wangrui@loongson.cn>
Cc: loongarch@lists.linux.dev, llvm@lists.linux.dev
Subject: objtool warnings "sibling call from callable instruction with
 modified stack frame" with CONFIG_LTO_CLANG_THIN
Message-ID: <20250731175655.GA1455142@ax162>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi LoongArch folks,

The kernel test robot recently generated several reports when building
with LLVM that appear to be related (the "warning: objtool:" reports):

https://lore.kernel.org/all/?q=loongarch-randconfig-002-20250730

This can be easily reproduced by enabling CONFIG_LTO_CLANG_THIN on top
of defconfig:

  $ make -skj"$(nproc)" ARCH=loongarch LLVM=1 clean defconfig

  $ scripts/config -d LTO_NONE -e LTO_CLANG_THIN

  $ make -skj"$(nproc)" ARCH=loongarch LLVM=1 olddefconfig all
  drivers/char/ipmi/ipmi_devintf.o: warning: objtool: ipmi_ioctl+0x7c: sibling call from callable instruction with modified stack frame
  net/802/garp.o: warning: objtool: garp_pdu_rcv+0x170: sibling call from callable instruction with modified stack frame
  drivers/rapidio/devices/rio_mport_cdev.o: warning: objtool: mport_cdev_ioctl+0xe4: sibling call from callable instruction with modified stack frame
  net/802/mrp.o: warning: objtool: mrp_attr_event+0x5c: sibling call from callable instruction with modified stack frame
  net/netfilter/nfnetlink_osf.o: warning: objtool: nf_osf_match_one+0x1ac: unreachable instruction
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_set_memslot+0x22c: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_dev_ioctl+0x68: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_emu_iocsr+0x74: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_emu_mmio_read+0x58: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_emu_mmio_write+0x114: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_handle_gspr.llvm.8483686505109456213+0x230: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_arch_vcpu_ioctl+0x3ac: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_arch_vm_ioctl+0xec: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_ipi_read+0xe8: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_ipi_write+0x12c: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_ipi_regs_access+0x84: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_eiointc_regs_access+0x50: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_pch_pic_regs_access+0x54: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_pch_pic_read+0x64: sibling call from callable instruction with modified stack frame
  arch/loongarch/kvm/kvm.o: warning: objtool: kvm_pch_pic_write+0x7c: sibling call from callable instruction with modified stack frame
  drivers/char/ipmi/ipmi_si.o: warning: objtool: smi_event_handler+0x120: sibling call from callable instruction with modified stack frame
  drivers/char/ipmi/ipmi_si.o: warning: objtool: kcs_event.llvm.13474012466233770392+0x140: sibling call from callable instruction with modified stack frame
  ...

x86_64 does not see these objtool warnings when LTO is enabled, is this
a backend issue or does objtool need to account for something that LLVM
does yet GCC does not?

Cheers,
Nathan
