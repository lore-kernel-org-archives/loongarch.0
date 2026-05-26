Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE8C3DF018
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794348; cv=none; b=hjmzZk1nwckrA5J9DVrSFdGHFa6SxnnKXVVRblNTimtplAA+6trf6qyt7o8y4ZqtOkQJAeFzCLk26GrAXUdW+Szj79q6bGl6W71YkNdDyfjGfTOo85jIJDiCkMt8+TgemEsPKjFhzQcxBwoxI7LT2zpucmppXCMmY3whjwgU2lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794348; c=relaxed/simple;
	bh=LfnSWz4aAlqeGsKSRG9C6O92hndiEbNfeOBWOdC5erM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b3K9NUqd4TbnXUv2rNI5bDpKTsTe2D4mAaUgloL/efloHc8fpFfQEJMxfA/B8yZcgbEioUW3sJs9tQP59COJk4d/8o3I+UbIzOD1LcTExalOAJyv1LFqhEM2sHN3KS1Y7WTLRVilcSxmjn9pOqhLhV3svOn8ueiC/6HmB73ZX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ad53098858f411f1aa26b74ffac11d73-20260526
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fc24231c-c49b-4c12-865b-67d9b12dc940,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.12,REQID:fc24231c-c49b-4c12-865b-67d9b12dc940,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:33cf0942ee48206d9be3190682110d02,BulkI
	D:260526191856VMJQLTJU,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad53098858f411f1aa26b74ffac11d73-20260526
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 742579748; Tue, 26 May 2026 19:18:52 +0800
From: Tao Cui <cuitao@kylinos.cn>
To: maobibo@loongson.cn,
	zhaotianrui@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 0/4] LoongArch: KVM: Add PV TLB flush support
Date: Tue, 26 May 2026 19:18:33 +0800
Message-ID: <20260526111837.2090768-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements paravirtualized TLB flush for LoongArch KVM
guests, following the same design as x86's kvm_pv_tlb_flush.

In multi-vCPU KVM guests, remote TLB flushes broadcast IPIs to all
target vCPUs, including those preempted by the host. Sending IPIs to
preempted vCPUs causes unnecessary VM exits and grows with vCPU count,
becoming severe in overcommitted deployments.

Reuse the existing steal-time shared memory page by adding a new
KVM_VCPU_FLUSH_TLB flag to the preempted byte. On the guest side,
skip IPIs to preempted vCPUs and set the flag via cmpxchg instead.
On the host side, when re-entering a vCPU in kvm_update_stolen_time(),
check and clear the flag; if set, drop the VPID to trigger a full TLB
flush on the next VM entry. No new shared memory page, hypercall, or
Kconfig option is needed.

Testing: boot a 32-vCPU guest with the following QEMU command, then
run the selftest benchmark inside the guest with sleep idle (PV helps)
and busy-spin (PV cannot optimize) modes respectively:

  /root/qemu_branch_origin/build/qemu-system-loongarch64 \
    -m 4G -smp 32 --cpu la464 --machine virt \
    -bios /root/bios_loongarch64/QEMU_EFI.fd \
    -kernel /boot/vmlinuz-7.1.0-rc4-next-20260522-pvtlb-v2+ \
    -initrd /tmp/ramdisk_test.gz \
    -serial mon:stdio \
    -netdev tap,id=net0,ifname=tap0,script=no,downscript=no \
    -device virtio-net-pci,netdev=net0 \
    -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" -nographic

  # PV TLB flush enabled (idle threads sleep, vCPUs get preempted)
  guest# ./pv_tlb_flush_test 1 31 50000 0

  # Baseline (idle threads busy-spin, all vCPUs stay active)
  guest# ./pv_tlb_flush_test 1 31 50000 1

  With PV TLB flush (sleep idle):    ~154,629 ns/flush
  Without PV TLB flush (busy-spin):  ~491,800 ns/flush

  Improvement: 68.6% latency reduction (~3.2x throughput increase)

Tao Cui (4):
  LoongArch: KVM: Preserve auto-enabled PV features on userspace
    override
  LoongArch: KVM: Add PV TLB flush support via steal-time shared memory
  LoongArch: KVM: Implement guest-side PV TLB flush
  KVM: selftests: loongarch: Add PV TLB flush performance test

 arch/loongarch/include/asm/kvm_host.h         |   3 +
 arch/loongarch/include/asm/kvm_para.h         |   9 ++
 arch/loongarch/include/asm/paravirt.h         |  21 +++
 arch/loongarch/include/uapi/asm/kvm.h         |   1 +
 arch/loongarch/include/uapi/asm/kvm_para.h    |   1 +
 arch/loongarch/kernel/paravirt.c              |  47 ++++++
 arch/loongarch/kernel/smp.c                   |  30 +++-
 arch/loongarch/kvm/trace.h                    |  15 ++
 arch/loongarch/kvm/vcpu.c                     |  17 ++-
 arch/loongarch/kvm/vm.c                       |   4 +
 .../kvm/loongarch/pv_tlb_flush_test.c         | 137 ++++++++++++++++++
 11 files changed, 277 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/loongarch/pv_tlb_flush_test.c

-- 
2.43.0

