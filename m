Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A091AA95E
	for <loongarch@lists.linux.dev>; Mon, 13 May 2024 01:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715562766; cv=none; b=icfZ9g4aGAbQQ1exh2NLD8BFYU1hknzJqUXWIpmh27cxxZ+8r1wiP6GZ9vn08oDVNTk9FcFEGIvOepbHMcKz6WSvjHnLuhtHR9Z9yOo6iFYcAWr2YQ2+xqRq4afpAmrgBGP3OXbEdjcYs9dshCzMJan1ffJ1MPpMeA9EgMWJkPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715562766; c=relaxed/simple;
	bh=3BUffUtk+rpz0Bi8pK17Oy853PU6iqE64lDci9jr/Hw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cIZsvKAkPyH/RmfObnahL+r2cRgzOnhICV3dW0IlP4QVDC2O1Pay1qPbYwK/tO9Su09nNs2VD+i2/axQM6PNLP6tW6djbgaRPdNXFqQnZREy4EZt8orACgDifHCuAJ6VOsgmQUANhC4cJKOahFHuQmhoKv0uy9NI/LHCMzyzyTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxR_AEaUFmgv0LAA--.29631S3;
	Mon, 13 May 2024 09:12:36 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax690DaUFmV1gcAA--.51334S2;
	Mon, 13 May 2024 09:12:35 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] LoongArch: KVM: Add Binary Translation extension support
Date: Mon, 13 May 2024 09:12:32 +0800
Message-Id: <20240513011235.3233776-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax690DaUFmV1gcAA--.51334S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Loongson Binary Translation (LBT) is used to accelerate binary
translation, which contains 4 scratch registers (scr0 to scr3), x86/ARM
eflags (eflags) and x87 fpu stack pointer (ftop).

Like FPU extension, here late enabling method is used for LBT. LBT context
is saved/restored on vcpu context switch path.

Also this patch set BT capability detection, and BT register get/set
interface for userspace vmm, so that vm supports migration with BT
extension.

Bibo Mao (3):
  LoongArch: KVM: Add HW Binary Translation extension support
  LoongArch: KVM: Add LBT feature detection with cpucfg
  LoongArch: KVM: Add vm migration support for LBT feature

 arch/loongarch/include/asm/kvm_host.h |   8 ++
 arch/loongarch/include/asm/kvm_vcpu.h |  10 ++
 arch/loongarch/include/uapi/asm/kvm.h |   7 ++
 arch/loongarch/kvm/exit.c             |   9 ++
 arch/loongarch/kvm/vcpu.c             | 168 +++++++++++++++++++++++++-
 5 files changed, 201 insertions(+), 1 deletion(-)

base-commit: f4345f05c0dfc73c617e66f3b809edb8ddd41075
-- 
2.39.3

