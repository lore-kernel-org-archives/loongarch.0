Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11913DE450
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794349; cv=none; b=Oqvsf/KtIGHv1Ylvf1jU8GgpNGsNlSqk+T6n3IWwcvnU/qStf0PnwLJI7hZoEct09DL8QOgFmdE9zlQhS5F6JzmEDz9HN8lXwH78pTfo/tLQq5uGsxGUqHmbsLPDyZX4b2Q+XXKDQMbcPN8bX2ZMCwAmh/vyia8IxT55TLsE7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794349; c=relaxed/simple;
	bh=XWCLMVhvjsGFpwUs5hdzH/SX289mbyQBSf7luJ+kOaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJr/RuCq+lq6WeitFWpSgLUhFguds3zIRq6Tf8VDFS3LW1GDlYc+XSFSfiPt7c0lsP2wR3bLeTO1Hq6oKZzg5m63M2XJ5uqkyYE1QNnl9J0QaU3OSwJGGyd6rhzj8jYQoOf+4bMwK9fcRfzosDfPtfZj2cdlU34dLKWdhGNjOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b34470b658f411f1aa26b74ffac11d73-20260526
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
X-CID-O-INFO: VERSION:1.3.12,REQID:03dcf0d8-f114-4f46-ac00-e90872581372,IP:20,
	URL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.3.12,REQID:03dcf0d8-f114-4f46-ac00-e90872581372,IP:20,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:EDM_GE969F26,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a45ddc810c96ea29a2b58ca90c506292,BulkI
	D:260526191905R23R0NB5,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2|127|865|898,TC:nil,Content:0|15|50,EDM:1|19,IP:-2,URL:0,File:nil,RT:nil,
	Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_AEC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b34470b658f411f1aa26b74ffac11d73-20260526
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1270391213; Tue, 26 May 2026 19:19:02 +0800
From: Tao Cui <cuitao@kylinos.cn>
To: maobibo@loongson.cn,
	zhaotianrui@loongson.cn,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: kernel@xen0n.name,
	Tao Cui <cuitao@kylinos.cn>
Subject: [PATCH 4/4] KVM: selftests: loongarch: Add PV TLB flush performance test
Date: Tue, 26 May 2026 19:18:37 +0800
Message-ID: <20260526111837.2090768-5-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526111837.2090768-1-cuitao@kylinos.cn>
References: <20260526111837.2090768-1-cuitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a multi-threaded benchmark to measure PV TLB flush performance
inside LoongArch KVM guests.

The test spawns flusher threads that repeatedly mmap/munmap to trigger
TLB shootdown IPIs, alongside idle threads that either sleep or
busy-spin. With PV TLB flush enabled, IPIs to preempted vCPUs are
replaced by deferred flags in the steal-time shared page.

Usage (inside guest):
  ./pv_tlb_flush_test <flushers> <idle> <iterations> <busy_idle>
  busy_idle=0: idle threads sleep (PV can skip IPIs to preempted vCPUs)
  busy_idle=1: idle threads spin (all vCPUs active, PV cannot optimize)

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 .../kvm/loongarch/pv_tlb_flush_test.c         | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/loongarch/pv_tlb_flush_test.c

diff --git a/tools/testing/selftests/kvm/loongarch/pv_tlb_flush_test.c b/tools/testing/selftests/kvm/loongarch/pv_tlb_flush_test.c
new file mode 100644
index 000000000000..9c5e50982367
--- /dev/null
+++ b/tools/testing/selftests/kvm/loongarch/pv_tlb_flush_test.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LoongArch PV TLB Flush Performance Test
+ *
+ * Measure the overhead of remote TLB flushes in a KVM guest by spawning
+ * flusher threads that repeatedly mmap/munmap (triggering TLB shootdown
+ * IPIs) alongside idle threads that either sleep or busy-spin.
+ *
+ * With PV TLB flush enabled, IPIs to preempted vCPUs are replaced by
+ * deferred flags in the steal-time shared page, reducing flush latency.
+ *
+ * Usage:
+ *   Compile on LoongArch guest:
+ *     gcc -O2 -static -pthread -o pv_tlb_flush_test pv_tlb_flush_test.c
+ *   Run (inside KVM guest):
+ *     ./pv_tlb_flush_test <flushers> <idle> <iterations> <busy_idle>
+ *   Examples:
+ *     ./pv_tlb_flush_test 1 31 50000 0   # 1 flusher, 31 sleep, PV helps
+ *     ./pv_tlb_flush_test 1 31 50000 1   # 1 flusher, 31 busy-spin, no PV
+ *
+ *   busy_idle=0: idle threads sleep, vCPUs get preempted, PV TLB flush
+ *                can skip IPIs to them
+ *   busy_idle=1: idle threads spin, all vCPUs stay active, PV TLB flush
+ *                cannot optimize (baseline for comparison)
+ */
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sched.h>
+#include <pthread.h>
+
+#define MEM_SIZE (2*1024*1024)
+#define DEFAULT_ITERS 50000
+
+static int nr_iters = DEFAULT_ITERS;
+static volatile int start_barrier;
+static volatile int stop_flag;
+static int busy_idle = 0;
+
+static inline unsigned long clock_ns(void) {
+    struct timespec ts;
+    clock_gettime(CLOCK_MONOTONIC, &ts);
+    return (unsigned long)ts.tv_sec * 1000000000UL + ts.tv_nsec;
+}
+
+static void pin_cpu(int cpu) {
+    cpu_set_t set;
+    CPU_ZERO(&set);
+    CPU_SET(cpu, &set);
+    sched_setaffinity(0, sizeof(set), &set);
+}
+
+static void *idle_thread(void *arg) {
+    while (!__atomic_load_n(&start_barrier, __ATOMIC_ACQUIRE));
+    if (busy_idle) {
+        volatile long sink = 0;
+        while (!__atomic_load_n(&stop_flag, __ATOMIC_ACQUIRE))
+            sink++;
+    } else {
+        while (!__atomic_load_n(&stop_flag, __ATOMIC_ACQUIRE))
+            usleep(1000);
+    }
+    return NULL;
+}
+
+static void *flush_thread(void *arg) {
+    unsigned long *result = arg;
+    unsigned long start, end;
+    int i;
+    size_t mem_size = MEM_SIZE;
+    while (!__atomic_load_n(&start_barrier, __ATOMIC_ACQUIRE));
+    start = clock_ns();
+    for (i = 0; i < nr_iters && !__atomic_load_n(&stop_flag, __ATOMIC_ACQUIRE); i++) {
+        void *p = mmap(NULL, mem_size, PROT_READ|PROT_WRITE,
+                       MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
+        if (p == MAP_FAILED) break;
+        for (size_t off = 0; off < mem_size; off += 65536)
+            ((volatile char*)p)[off] = 0;
+        munmap(p, mem_size);
+    }
+    end = clock_ns();
+    *result = end - start;
+    return NULL;
+}
+
+int main(int argc, char **argv) {
+    int nr_flush = 1, nr_idle = 3, i, run;
+    if (argc > 1) nr_flush = atoi(argv[1]);
+    if (argc > 2) nr_idle = atoi(argv[2]);
+    if (argc > 3) nr_iters = atoi(argv[3]);
+    if (argc > 4) busy_idle = atoi(argv[4]);
+
+    printf("=== TLB Flush Benchmark ===\n");
+    printf("CPUs: %d  Flushers: %d  Idle: %d  Iters: %d  Mode: %s\n",
+           (int)sysconf(_SC_NPROCESSORS_ONLN), nr_flush, nr_idle, nr_iters,
+           busy_idle ? "busy-spin" : "sleep");
+
+    for (run = 0; run < 3; run++) {
+        int total = nr_flush + nr_idle;
+        pthread_t threads[64];
+        unsigned long results[64];
+        start_barrier = 0; stop_flag = 0;
+
+        for (i = 0; i < nr_idle; i++) {
+            pthread_create(&threads[i], NULL, idle_thread, NULL);
+            if (total <= sysconf(_SC_NPROCESSORS_ONLN))
+                pin_cpu(nr_flush + i);
+        }
+        for (i = 0; i < nr_flush; i++) {
+            results[nr_idle + i] = 0;
+            pthread_create(&threads[nr_idle + i], NULL, flush_thread, &results[nr_idle + i]);
+            if (total <= sysconf(_SC_NPROCESSORS_ONLN))
+                pin_cpu(i);
+        }
+
+        usleep(10000);
+        __atomic_store_n(&start_barrier, 1, __ATOMIC_RELEASE);
+        for (i = 0; i < nr_flush; i++)
+            pthread_join(threads[nr_idle + i], NULL);
+        __atomic_store_n(&stop_flag, 1, __ATOMIC_RELEASE);
+        for (i = 0; i < nr_idle; i++)
+            pthread_join(threads[i], NULL);
+
+        unsigned long total_ns = 0;
+        for (i = 0; i < nr_flush; i++) {
+            printf("  Run %d: %lu ns/flush\n", run, results[nr_idle + i] / nr_iters);
+            total_ns += results[nr_idle + i];
+        }
+        printf("  Run %d Avg: %lu ns/flush\n", run,
+               total_ns / (nr_flush * (unsigned long)nr_iters));
+    }
+    return 0;
+}
-- 
2.43.0

