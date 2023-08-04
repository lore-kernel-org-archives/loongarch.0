Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDE6134B3
	for <loongarch@lists.linux.dev>; Fri,  4 Aug 2023 15:33:01 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d3d729a08e4so2517273276.3
        for <loongarch@lists.linux.dev>; Fri, 04 Aug 2023 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691163180; x=1691767980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKylUnd028FWgrPUAFRbuJwa3rsNXsvhALZm8JlmZzo=;
        b=sxqgCNh5sE276naqOGqJHcebfYQ8vboPRS86BmXUC7kYD3qBpP+CGGjIq5Dnn+GvDq
         G7A9ppbmz8easrgHjdfF8V+wFi48ka/pCxPmRNKfW6V7KTtkAGEVxkHlQrATXGouX+0k
         XBfZtybtjF6pQ0jo+wFvOzmIPqd5mFzKBDh1Ghnq8T97KpJje32PxauWL3fTZ9ENHCpj
         SKU0dKqX3vZNCG5+9Zr/1YovSRQXdQVD4tdSYRH0oUiGvTI876e5SRp755QB/FIow8+R
         S68SOzPhqOwU+Y1Topp4IBxZW8m1IvnInXTLIqkOOE+YYDZkwWsERl01jlMgaF8gV+Iz
         4PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163180; x=1691767980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKylUnd028FWgrPUAFRbuJwa3rsNXsvhALZm8JlmZzo=;
        b=gVOyaS4EAL3JOB76tCEg2cRtZ6T5OZA7DPQtgSKenluR/54Qs1bqabbEQKXuoMuQsX
         nC0u+e6vdPh4Eq2csPmopvCkrmwgK5Cbs3wIcoWFzqm+NRTARWuG3shXBxftP+oN9Buh
         EO9TE7Yql2oo7xWIDs8YkqI3cE/9MAMT+TMBO/HV9pM+ESO6gn2xl0lulqzVPifno7rL
         HbkI5VeAy1icVoaxjYVg4E/2z8YZhycy6jN7H8aSohRD7tBeXDXay71yi4zPT4eC8O2E
         9dPBWr3Kj46cPhBq4tggpbcPv781J2mZlATJEgIVnWkHO27iVw7PBBByF4zQHV7ovBeX
         eH2g==
X-Gm-Message-State: AOJu0YwSQ8DeTJ2MC8wHZWx5kXDqquGRIyv2fR4bPgnRzX0hnMerwM2X
	Vri6AxNWljv07XvY/h+uB6cc4wuHzyqXXRviwMM=
X-Google-Smtp-Source: AGHT+IFzPzk2F7C5QklwDvvG9e9z1pwQHIKHbBy+stPBPltppo8U31f7nZHZWJmSAfBJ4Is7IqIP7Tm/81Yq0DoC7kg=
X-Received: by 2002:a25:26c9:0:b0:d0d:786:2999 with SMTP id
 m192-20020a2526c9000000b00d0d07862999mr1878306ybm.29.1691163180075; Fri, 04
 Aug 2023 08:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Liam Ni <zhiguangni01@gmail.com>
Date: Fri, 4 Aug 2023 23:32:51 +0800
Message-ID: <CACZJ9cUXiWxDb6hF4JFhWe7Np82k6LopVQ+_AoGFOccN4kjJqA@mail.gmail.com>
Subject: [RESEND PATCH V3] NUMA:Improve the efficiency of calculating pages loss
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Cc: zhoubinbin@loongson.cn, chenfeiyang@loongson.cn, jiaxun.yang@flygoat.com, 
	Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	peterz@infradead.org, luto@kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, kernel@xen0n.name, chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Optimize the way of calculating missing pages.

In the previous implementation, We calculate missing pages as follows:
1. calculate numaram by traverse all the numa_meminfo's and for each of
them traverse all the regions in memblock.memory to prepare for
counting missing pages.

2. Traverse all the regions in memblock.memory again to get e820ram.

3. the missing page is (e820ram - numaram )

But,it's enough to count memory in =E2=80=98memblock.memory=E2=80=99 that d=
oesn't have
the node assigned.

V2:https://lore.kernel.org/all/20230619075315.49114-1-zhiguangni01@gmail.co=
m/
V1:https://lore.kernel.org/all/20230615142016.419570-1-zhiguangni01@gmail.c=
om/

Signed-off-by: Liam Ni <zhiguangni01@gmail.com>
---
 arch/loongarch/kernel/numa.c | 23 ++++++++---------------
 arch/x86/mm/numa.c           | 26 +++++++-------------------
 include/linux/mm.h           |  1 +
 mm/mm_init.c                 | 20 ++++++++++++++++++++
 4 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 708665895b47..0239891e4d19 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -262,25 +262,18 @@ static void __init node_mem_init(unsigned int node)
  * Sanity check to catch more bad NUMA configurations (they are amazingly
  * common).  Make sure the nodes cover all memory.
  */
-static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi=
)
+static bool __init memblock_validate_numa_coverage(const u64 limit)
 {
-       int i;
-       u64 numaram, biosram;
+       u64 lo_pg;

-       numaram =3D 0;
-       for (i =3D 0; i < mi->nr_blks; i++) {
-               u64 s =3D mi->blk[i].start >> PAGE_SHIFT;
-               u64 e =3D mi->blk[i].end >> PAGE_SHIFT;
+       lo_pg =3D max_pfn - calculate_without_node_pages_in_range();

-               numaram +=3D e - s;
-               numaram -=3D __absent_pages_in_range(mi->blk[i].nid, s, e);
-               if ((s64)numaram < 0)
-                       numaram =3D 0;
+       /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
+       if (lo_pg >=3D limit) {
+               pr_err("NUMA: We lost 1m size page.\n");
+               return false;
        }
-       max_pfn =3D max_low_pfn;
-       biosram =3D max_pfn - absent_pages_in_range(0, max_pfn);

-       BUG_ON((s64)(biosram - numaram) >=3D (1 << (20 - PAGE_SHIFT)));
        return true;
 }

@@ -428,7 +421,7 @@ int __init init_numa_memory(void)
                return -EINVAL;

        init_node_memblock();
-       if (numa_meminfo_cover_memory(&numa_meminfo) =3D=3D false)
+       if (memblock_validate_numa_coverage(SZ_1M) =3D=3D false)
                return -EINVAL;

        for_each_node_mask(node, node_possible_map) {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 2aadb2019b4f..14feec144675 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -451,30 +451,18 @@ EXPORT_SYMBOL(__node_distance);
  * Sanity check to catch more bad NUMA configurations (they are amazingly
  * common).  Make sure the nodes cover all memory.
  */
-static bool __init numa_meminfo_cover_memory(const struct numa_meminfo *mi=
)
+static bool __init memblock_validate_numa_coverage(const u64 limit)
 {
-       u64 numaram, e820ram;
-       int i;
+       u64 lo_pg;

-       numaram =3D 0;
-       for (i =3D 0; i < mi->nr_blks; i++) {
-               u64 s =3D mi->blk[i].start >> PAGE_SHIFT;
-               u64 e =3D mi->blk[i].end >> PAGE_SHIFT;
-               numaram +=3D e - s;
-               numaram -=3D __absent_pages_in_range(mi->blk[i].nid, s, e);
-               if ((s64)numaram < 0)
-                       numaram =3D 0;
-       }
-
-       e820ram =3D max_pfn - absent_pages_in_range(0, max_pfn);
+       lo_pg =3D max_pfn - calculate_without_node_pages_in_range();

        /* We seem to lose 3 pages somewhere. Allow 1M of slack. */
-       if ((s64)(e820ram - numaram) >=3D (1 << (20 - PAGE_SHIFT))) {
-               printk(KERN_ERR "NUMA: nodes only cover %LuMB of your
%LuMB e820 RAM. Not used.\n",
-                      (numaram << PAGE_SHIFT) >> 20,
-                      (e820ram << PAGE_SHIFT) >> 20);
+       if (lo_pg >=3D limit) {
+               pr_err("NUMA: We lost 1m size page.\n");
                return false;
        }
+
        return true;
 }

@@ -583,7 +571,7 @@ static int __init numa_register_memblks(struct
numa_meminfo *mi)
                        return -EINVAL;
                }
        }
-       if (!numa_meminfo_cover_memory(mi))
+       if (!memblock_validate_numa_coverage(SZ_1M))
                return -EINVAL;

        /* Finally register nodes. */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0daef3f2f029..b32457ad1ae3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3043,6 +3043,7 @@ unsigned long __absent_pages_in_range(int nid,
unsigned long start_pfn,
                                                unsigned long end_pfn);
 extern unsigned long absent_pages_in_range(unsigned long start_pfn,
                                                unsigned long end_pfn);
+extern unsigned long calculate_without_node_pages_in_range(void);
 extern void get_pfn_range_for_nid(unsigned int nid,
                        unsigned long *start_pfn, unsigned long *end_pfn);

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ddd18a89b66..13a4883787e3 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1132,6 +1132,26 @@ static void __init
adjust_zone_range_for_zone_movable(int nid,
        }
 }

+/**
+ * @start_pfn: The start PFN to start searching for holes
+ * @end_pfn: The end PFN to stop searching for holes
+ *
+ * Return: Return the number of page frames without node assigned
within a range.
+ */
+unsigned long __init calculate_without_node_pages_in_range(void)
+{
+       unsigned long num_pages;
+       unsigned long start_pfn, end_pfn;
+       int nid, i;
+
+       for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid)=
 {
+               if (nid =3D=3D NUMA_NO_NODE)
+                       num_pages +=3D end_pfn - start_pfn;
+       }
+
+       return num_pages;
+}
+
 /*
  * Return the number of holes in a range on a node. If nid is MAX_NUMNODES=
,
  * then all holes in the requested range will be accounted for.
--
2.25.1
