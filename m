Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBFF1FD8
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 02:56:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Dxmdl6+Opj01cAAA--.975S3;
	Tue, 14 Feb 2023 10:56:58 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axeb1w+OpjmZwyAA--.28802S25;
	Tue, 14 Feb 2023 10:56:57 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Mark Brown <broonie@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v1 23/24] LoongArch: KVM: Implement probe virtualization when loongarch cpu init
Date: Tue, 14 Feb 2023 10:56:47 +0800
Message-Id: <20230214025648.1898508-24-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Axeb1w+OpjmZwyAA--.28802S25
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zw1fCFWfZw1DJr47ZrW5KFg_yoW8tFy5pr
	W2vFW3trWUKr92ga93Gr1agrnxtFWkKa129F47tayfAr4Ut3W5Xwn3C34UCFs7Zw4xAryr
	Xrn7A3WvqF1DX3JanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1s
	IEY20_WwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCjc4
	AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj4RKpBTUUUUU

Implement probe virtualization when loongarch cpu init, including guest
gid info, guest fpu info, etc.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 arch/loongarch/kernel/cpu-probe.c | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 3a3fce2d7..9c3483d9a 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -176,6 +176,57 @@ static void cpu_probe_common(struct cpuinfo_loongarch *c)
 	}
 }
 
+static inline void cpu_probe_guestinfo(struct cpuinfo_loongarch *c)
+{
+	unsigned long guestinfo;
+
+	guestinfo = read_csr_gstat();
+	if (guestinfo & CSR_GSTAT_GIDBIT) {
+		c->options |= LOONGARCH_CPU_GUESTID;
+		write_csr_gstat(0);
+	}
+}
+
+static inline void cpu_probe_lvz(struct cpuinfo_loongarch *c)
+{
+	unsigned long gcfg, gprcfg1;
+
+	cpu_probe_guestinfo(c);
+
+	c->guest.options |= LOONGARCH_CPU_FPU;
+	c->guest.options_dyn |= LOONGARCH_CPU_FPU;
+	c->guest.options_dyn |= LOONGARCH_CPU_PMP;
+
+	c->guest.ases |= LOONGARCH_CPU_LSX;
+	c->guest.ases_dyn |= LOONGARCH_CPU_LSX;
+	gprcfg1 = read_gcsr_prcfg1();
+	c->guest.kscratch_mask = GENMASK((gprcfg1 & CSR_CONF1_KSNUM) - 1, 0);
+
+	gcfg = read_csr_gcfg();
+	if (gcfg & CSR_GCFG_MATP_GUEST)
+		c->guest_cfg |= BIT(0);
+	if (gcfg & CSR_GCFG_MATP_ROOT)
+		c->guest_cfg |= BIT(1);
+	if (gcfg & CSR_GCFG_MATP_NEST)
+		c->guest_cfg |= BIT(2);
+	if (gcfg & CSR_GCFG_SITP)
+		c->guest_cfg |= BIT(6);
+	if (gcfg & CSR_GCFG_TITP)
+		c->guest_cfg |= BIT(8);
+	if (gcfg & CSR_GCFG_TOEP)
+		c->guest_cfg |= BIT(10);
+	if (gcfg & CSR_GCFG_TOPP)
+		c->guest_cfg |= BIT(12);
+	if (gcfg & CSR_GCFG_TORUP)
+		c->guest_cfg |= BIT(14);
+	if (gcfg & CSR_GCFG_GCIP_ALL)
+		c->guest_cfg |= BIT(16);
+	if (gcfg & CSR_GCFG_GCIP_HIT)
+		c->guest_cfg |= BIT(17);
+	if (gcfg & CSR_GCFG_GCIP_SECURE)
+		c->guest_cfg |= BIT(18);
+}
+
 #define MAX_NAME_LEN	32
 #define VENDOR_OFFSET	0
 #define CPUNAME_OFFSET	9
@@ -289,6 +340,8 @@ void cpu_probe(void)
 	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vabits) - 1);
 #endif
+	if (cpu_has_lvz)
+		cpu_probe_lvz(c);
 
 	cpu_report();
 }
-- 
2.31.1

