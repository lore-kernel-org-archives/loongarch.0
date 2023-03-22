Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19D723AD
	for <loongarch@lists.linux.dev>; Wed, 22 Mar 2023 09:07:21 +0000 (UTC)
X-UUID: 4be84bec8c8a4e0f9cbfd39daf0584f4-20230322
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:94d3a063-91ef-4e6a-a741-7256bb7aabf3,IP:10,
	URL:0,TC:0,Content:-25,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:5
X-CID-INFO: VERSION:1.1.20,REQID:94d3a063-91ef-4e6a-a741-7256bb7aabf3,IP:10,UR
	L:0,TC:0,Content:-25,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:25b5999,CLOUDID:a8062329-564d-42d9-9875-7c868ee415ec,B
	ulkID:230322170209RQL3LODN,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
	TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 4be84bec8c8a4e0f9cbfd39daf0584f4-20230322
X-User: lienze@kylinos.cn
Received: from localhost.localdomain [(210.12.40.82)] by mailgw
	(envelope-from <lienze@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93117112; Wed, 22 Mar 2023 17:02:09 +0800
From: Enze Li <lienze@kylinos.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	enze.li@gmx.com,
	lienze@kylinos.cn
Subject: [PATCH] LoongArch: cpuinfo: standardize the "model name" field
Date: Wed, 22 Mar 2023 17:05:33 +0800
Message-Id: <20230322090533.4079453-1-lienze@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When I use the latest version of lscpu to check my CPU info, I see,

======
Architecture:          loongarch64
  Byte Order:          Little Endian
CPU(s):                4
  On-line CPU(s) list: 0-3
Model name:            -
  Thread(s) per core:  1
  Core(s) per socket:  4
...
======

Obviously, the "Model name" field shows me with a "-", which means the
lscpu failed to retrieve the correct information from the /proc/cpuinfo
file.

The main problem is that, the lscpu only identifies the data by its
"model name" field.  However, on the LoongArch platform, only 'Model
Name' is provided, which cannot be accurately identified due to case
sensitivity issues.  And I think that must be an oversight.

This patch fixes this issue.  With this patch applied, I get,

======
Architecture:          loongarch64
  Byte Order:          Little Endian
CPU(s):                4
  On-line CPU(s) list: 0-3
Model name:            Loongson-3A5000-HV
  Thread(s) per core:  1
  Core(s) per socket:  4
...
======

Signed-off-by: Enze Li <lienze@kylinos.cn>
---
 arch/loongarch/kernel/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index 5c67cc4fd56d..7da56f9ee15c 100644
--- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -50,7 +50,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 	seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
 	seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
 	seq_printf(m, "CPU Family\t\t: %s\n", __cpu_family[n]);
-	seq_printf(m, "Model Name\t\t: %s\n", __cpu_full_name[n]);
+	seq_printf(m, "model name\t\t: %s\n", __cpu_full_name[n]);
 	seq_printf(m, "CPU Revision\t\t: 0x%02x\n", version);
 	seq_printf(m, "FPU Revision\t\t: 0x%02x\n", fp_version);
 	seq_printf(m, "CPU MHz\t\t\t: %llu.%02llu\n",

base-commit: fc89d7fb499b0162e081f434d45e8d1b47e82ece
-- 
2.34.1

