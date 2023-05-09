Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B94171CC
	for <loongarch@lists.linux.dev>; Tue,  9 May 2023 07:53:58 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8DxDesV_FlkZeMGAA--.11612S3;
	Tue, 09 May 2023 15:53:57 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFLUK_FlkIEhSAA--.16908S23;
	Tue, 09 May 2023 15:53:57 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	maobibo@loongson.cn,
	Xi Ruoyao <xry111@xry111.site>,
	zhaotianrui@loongson.cn
Subject: [PATCH v9 21/30] LoongArch: KVM: Implement handle iocsr exception
Date: Tue,  9 May 2023 15:53:37 +0800
Message-Id: <20230509075346.1023386-22-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230509075346.1023386-1-zhaotianrui@loongson.cn>
References: <20230509075346.1023386-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxFLUK_FlkIEhSAA--.16908S23
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWFWrGw17Kry5ZFy7ArWxXrb_yoWrJF1Upa
	yUZryktrW8Wwn3twsxtrs7Xr1aqF48Gry7JFZxJw4furW2ya45Jr4vkrnFvF98K393Gr4I
	9w1fJryxuF1qy3JanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bzxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6x
	kF7I0E14v26F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAq
	jxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6c
	x26rWlOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48J
	MxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxV
	WUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7xRihFxUUUUUU==

Implement kvm handle vcpu iocsr exception, setting the iocsr info into
vcpu_run and return to user space to handle it.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/include/asm/inst.h | 16 ++++++
 arch/loongarch/kvm/exit.c         | 92 +++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index b09887ffcd15..db5857796432 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -56,6 +56,14 @@ enum reg2_op {
 	revbd_op	= 0x0f,
 	revh2w_op	= 0x10,
 	revhd_op	= 0x11,
+	iocsrrdb_op     = 0x19200,
+	iocsrrdh_op     = 0x19201,
+	iocsrrdw_op     = 0x19202,
+	iocsrrdd_op     = 0x19203,
+	iocsrwrb_op     = 0x19204,
+	iocsrwrh_op     = 0x19205,
+	iocsrwrw_op     = 0x19206,
+	iocsrwrd_op     = 0x19207,
 };
 
 enum reg2i5_op {
@@ -298,6 +306,13 @@ struct reg3sa2_format {
 	unsigned int opcode : 15;
 };
 
+struct reg2csr_format {
+	unsigned int rd : 5;
+	unsigned int rj : 5;
+	unsigned int csr : 14;
+	unsigned int opcode : 8;
+};
+
 union loongarch_instruction {
 	unsigned int word;
 	struct reg0i15_format	reg0i15_format;
@@ -313,6 +328,7 @@ union loongarch_instruction {
 	struct reg2bstrd_format	reg2bstrd_format;
 	struct reg3_format	reg3_format;
 	struct reg3sa2_format	reg3sa2_format;
+	struct reg2csr_format   reg2csr_format;
 };
 
 #define LOONGARCH_INSN_SIZE	sizeof(union loongarch_instruction)
diff --git a/arch/loongarch/kvm/exit.c b/arch/loongarch/kvm/exit.c
index 508cbce31aa5..bd33fe0c6424 100644
--- a/arch/loongarch/kvm/exit.c
+++ b/arch/loongarch/kvm/exit.c
@@ -96,3 +96,95 @@ static int _kvm_handle_csr(struct kvm_vcpu *vcpu, larch_inst inst)
 
 	return EMULATE_DONE;
 }
+
+int _kvm_emu_iocsr(larch_inst inst, struct kvm_run *run, struct kvm_vcpu *vcpu)
+{
+	u32 rd, rj, opcode;
+	u32 addr;
+	unsigned long val;
+	int ret;
+
+	/*
+	 * Each IOCSR with different opcode
+	 */
+	rd = inst.reg2_format.rd;
+	rj = inst.reg2_format.rj;
+	opcode = inst.reg2_format.opcode;
+	addr = vcpu->arch.gprs[rj];
+	ret = EMULATE_DO_IOCSR;
+	run->iocsr_io.phys_addr = addr;
+	run->iocsr_io.is_write = 0;
+
+	/* LoongArch is Little endian */
+	switch (opcode) {
+	case iocsrrdb_op:
+		run->iocsr_io.len = 1;
+		break;
+	case iocsrrdh_op:
+		run->iocsr_io.len = 2;
+		break;
+	case iocsrrdw_op:
+		run->iocsr_io.len = 4;
+		break;
+	case iocsrrdd_op:
+		run->iocsr_io.len = 8;
+		break;
+	case iocsrwrb_op:
+		run->iocsr_io.len = 1;
+		run->iocsr_io.is_write = 1;
+		break;
+	case iocsrwrh_op:
+		run->iocsr_io.len = 2;
+		run->iocsr_io.is_write = 1;
+		break;
+	case iocsrwrw_op:
+		run->iocsr_io.len = 4;
+		run->iocsr_io.is_write = 1;
+		break;
+	case iocsrwrd_op:
+		run->iocsr_io.len = 8;
+		run->iocsr_io.is_write = 1;
+		break;
+	default:
+		ret = EMULATE_FAIL;
+		break;
+	}
+
+	if (ret == EMULATE_DO_IOCSR) {
+		if (run->iocsr_io.is_write) {
+			val = vcpu->arch.gprs[rd];
+			memcpy(run->iocsr_io.data, &val, run->iocsr_io.len);
+		}
+		vcpu->arch.io_gpr = rd;
+	}
+
+	return ret;
+}
+
+int _kvm_complete_iocsr_read(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	unsigned long *gpr = &vcpu->arch.gprs[vcpu->arch.io_gpr];
+	enum emulation_result er = EMULATE_DONE;
+
+	switch (run->iocsr_io.len) {
+	case 8:
+		*gpr = *(s64 *)run->iocsr_io.data;
+		break;
+	case 4:
+		*gpr = *(int *)run->iocsr_io.data;
+		break;
+	case 2:
+		*gpr = *(short *)run->iocsr_io.data;
+		break;
+	case 1:
+		*gpr = *(char *) run->iocsr_io.data;
+		break;
+	default:
+		kvm_err("Bad IOCSR length: %d,addr is 0x%lx",
+				run->iocsr_io.len, vcpu->arch.badv);
+		er = EMULATE_FAIL;
+		break;
+	}
+
+	return er;
+}
-- 
2.31.1

