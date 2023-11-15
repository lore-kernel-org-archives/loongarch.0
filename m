Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC7A63A5
	for <loongarch@lists.linux.dev>; Wed, 15 Nov 2023 09:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8DxPOsikFRlUTw6AA--.43513S3;
	Wed, 15 Nov 2023 17:32:18 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx7twhkFRlq99CAA--.16093S2;
	Wed, 15 Nov 2023 17:32:17 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn
Subject: [PATCH v1 0/2] LoongArch: KVM: Add LSX,LASX support
Date: Wed, 15 Nov 2023 17:19:19 +0800
Message-Id: <20231115091921.85516-1-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx7twhkFRlq99CAA--.16093S2
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

This patch series add LSX,LASX support for LoongArch KVM.
LSX: LoongArch 128-bits vector instruction
LASX:LoongArch 256-bits vector instruction

There will be LSX,LASX exception in KVM when guest use the
LSX,LASX instructions. KVM will enable LSX,LASX and restore
the vector registers for guest then return to guest to continue
running.

Changes for v1:
(1) Add LSX support for LoongArch KVM.
(2) Add LASX support for LoongArch KVM.

Tianrui Zhao (1):
  LoongArch: KVM: Add lsx support

zhaotianrui (1):
  LoongArch: KVM: Add lasx support

 arch/loongarch/include/asm/kvm_host.h | 12 ++++
 arch/loongarch/include/asm/kvm_vcpu.h | 22 +++++++
 arch/loongarch/kernel/fpu.S           |  1 +
 arch/loongarch/kvm/exit.c             | 36 +++++++++++
 arch/loongarch/kvm/switch.S           | 38 ++++++++++++
 arch/loongarch/kvm/trace.h            |  6 +-
 arch/loongarch/kvm/vcpu.c             | 88 ++++++++++++++++++++++++++-
 7 files changed, 199 insertions(+), 4 deletions(-)

-- 
2.39.1

