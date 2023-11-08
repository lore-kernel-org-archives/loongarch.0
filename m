Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96916137E
	for <loongarch@lists.linux.dev>; Wed,  8 Nov 2023 02:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.2.5.185])
	by gateway (Coremail) with SMTP id _____8Bxd+i590plnuc3AA--.8211S3;
	Wed, 08 Nov 2023 10:51:37 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax3tyy90plX7U7AA--.63786S6;
	Wed, 08 Nov 2023 10:51:33 +0800 (CST)
From: Tianrui Zhao <zhaotianrui@loongson.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev,
	Peter Xu <peterx@redhat.com>,
	Vipin Sharma <vipinsh@google.com>,
	maobibo@loongson.cn,
	zhaotianrui@loongson.cn,
	Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 4/4] KVM: selftests: Add test cases for LoongArch
Date: Wed,  8 Nov 2023 10:51:34 +0800
Message-Id: <20231108025134.2592663-5-zhaotianrui@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20231108025134.2592663-1-zhaotianrui@loongson.cn>
References: <20231108025134.2592663-1-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax3tyy90plX7U7AA--.63786S6
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are some KVM common test cases supported by LoongArch:
	demand_paging_test
	dirty_log_perf_test
	dirty_log_test
	guest_print_test
	kvm_binary_stats_test
	kvm_create_max_vcpus
	kvm_page_table_test
	memslot_modification_stress_test
	memslot_perf_test
	set_memory_region_test
And other test cases are not supported by LoongArch. For example,
we do not support rseq_test, as the glibc do not support it.

Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
---
 tools/testing/selftests/kvm/Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a5963ab9215..9d099d48013 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -65,6 +65,10 @@ LIBKVM_s390x += lib/s390x/ucall.c
 LIBKVM_riscv += lib/riscv/processor.c
 LIBKVM_riscv += lib/riscv/ucall.c
 
+LIBKVM_loongarch += lib/loongarch/processor.c
+LIBKVM_loongarch += lib/loongarch/ucall.c
+LIBKVM_loongarch += lib/loongarch/exception.S
+
 # Non-compiled test targets
 TEST_PROGS_x86_64 += x86_64/nx_huge_pages_test.sh
 
@@ -202,6 +206,17 @@ TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 
 SPLIT_TESTS += get-reg-list
 
+TEST_GEN_PROGS_loongarch += demand_paging_test
+TEST_GEN_PROGS_loongarch += dirty_log_perf_test
+TEST_GEN_PROGS_loongarch += dirty_log_test
+TEST_GEN_PROGS_loongarch += guest_print_test
+TEST_GEN_PROGS_loongarch += kvm_binary_stats_test
+TEST_GEN_PROGS_loongarch += kvm_create_max_vcpus
+TEST_GEN_PROGS_loongarch += kvm_page_table_test
+TEST_GEN_PROGS_loongarch += memslot_modification_stress_test
+TEST_GEN_PROGS_loongarch += memslot_perf_test
+TEST_GEN_PROGS_loongarch += set_memory_region_test
+
 TEST_PROGS += $(TEST_PROGS_$(ARCH_DIR))
 TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH_DIR))
 TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH_DIR))
-- 
2.39.1

