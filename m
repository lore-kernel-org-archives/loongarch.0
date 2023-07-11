Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF50182B6
	for <loongarch@lists.linux.dev>; Tue, 11 Jul 2023 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1689070936; bh=NmkIsSCGaSmG93pUP0j3sw7fLc5IONMtW4jX2nFbWrM=;
	h=From:To:Cc:Subject:Date:From;
	b=MMrFG/hTmh8HQEcyWCsO/pD0oJw1pKMSaG1DK1apHGPzxCYtdnNcIVlqhSivEyHND
	 Se4bRexAdsaK8803cYzivVQC6Z72pzMaoAASpxPQ8X42RviAG36aP0BAaGGfNJ80XM
	 GHMcc1qEqZX2QIx8mb3g4ax/JfY/zHtvXX2+iWA4=
Received: from ld50.lan (unknown [101.88.28.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7AD826011B;
	Tue, 11 Jul 2023 18:22:13 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: WANG Xuerui <git@xen0n.name>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH] perf symbols: Add __arch_cpu_idle to the list of idle symbols
Date: Tue, 11 Jul 2023 18:22:02 +0800
Message-Id: <20230711102202.1206488-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

The LoongArch port's idle symbol is named __arch_cpu_idle, which is
different from everyone else, so let's mark it as such.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
---

This is probably v6.5 material? I'd prefer getting this merged via the
perf tree rather than loongarch, because it's arguably not related to
normal functionality (only noisier perf outputs). 

 tools/perf/util/symbol.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index f849f9ef68e6..94847f794843 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -712,6 +712,7 @@ int modules__parse(const char *filename, void *arg,
 static bool symbol__is_idle(const char *name)
 {
 	const char * const idle_symbols[] = {
+		"__arch_cpu_idle",
 		"acpi_idle_do_entry",
 		"acpi_processor_ffh_cstate_enter",
 		"arch_cpu_idle",
-- 
2.40.0

