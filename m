Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289B1343899
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517811; cv=none; b=O6/fk5Dj4EsRm6GdzpSn/+8mQHWvb2jDatRFGcos70l+Pg1LNLbeB8nGY71ld7aXR+te0/guBeIjIEAPNOlb0Pn5XJbnEUxOmwgkAecmJq0ExMyjiCX3xabeN+2v7O1is+PFneRkpXHwWya/zS8gcexwyzWeiUXEYpQoigjDQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517811; c=relaxed/simple;
	bh=nweLy+dhiToADoTW6oCvB/QbMAtGdXPEmmFCoRpIUHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQHNNRADL9H31ZasklnLp5lw+oq6vc36kF/gLj0qKv7VyzqEJHpedgISGptrnCKRFQocZpaKhrW/m3sMmSs11HUBDjIsLXXPRd41VeCFqXsaxx5tk03Zk0qTIA5XuFkewV7Gd2+rRSOZd5UgeOuxMe07ZHQiM5+zuDeF3tAZMAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8AxHNItGXxqNnYAAA--.1474S3;
	Wed, 12 Aug 2026 14:56:45 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJAxmM0sGXxqK7oBAA--.10384S2;
	Wed, 12 Aug 2026 14:56:44 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v3 0/3] EDAC/loongson: Improvements for Loongson EDAC driver
Date: Wed, 12 Aug 2026 14:41:36 +0800
Message-ID: <20260812064139.1231-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM0sGXxqK7oBAA--.10384S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr4xZF1fKw17KrWrGF18CrX_yoW8tw1xpF
	W5ua98Gr4qqr1Ik39ayw1Iv3Z8K395Jw4qqan2y34rZr13A34UXw4ftrW8uFnrAr4ftF15
	XFy0gFnaganrA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

This series contains three patches for the Loongson EDAC driver:

Patch 1: Encode node and MC info into mc_idx so that on multi-node
systems, sysfs entries uniquely identify each controller.

Patch 2: Get DIMM size from ACPI _DSM method instead of using hardcoded
values, enabling correct display of memory size in sysfs.

Patch 3: Add CS4-7 timeout filter for cross-node access on 3C6000
multi-node systems to prevent false CE error reports.

Changes in v3:

Patch 1 "Encode node and MC info into mc_idx":
- Drop mc_idx_u32 temporary variable; pass &mci->mc_idx directly
- Rename device property mc-per-node -> mcs-per-node

Patch 2 "Get DIMM size from ACPI _DSM method":
- Fix subject: get -> Get
- No code changes

Patch 3 "Add CS4-7 timeout filter for cross-node access":
- No changes

Changes in v2:

Patch 1 "Encode node and MC info into mc_idx":
- Use char other_detail[64] = {0} and drop the else branch
- Put snprintf() on one line
- Initialize mc_idx_valid = true and drop the else branch
- Validate mc-per-node firmware property is non-zero to prevent
  division by zero
- Wrap pvt_init() function definition to satisfy 100-column limit

Patch 2 "get DIMM size from ACPI _DSM method":
- No changes; rebased on top of updated patch 1.

Patch 3 "Add CS4-7 timeout filter for cross-node access":
- Assign valid_cs_bits before calling read_ecc() in pvt_init() to
  prevent using uninitialized data when establishing the baseline
  error count
- Add bounds check for valid_cs_bits < 64 to guard against undefined
  behavior when shifting a 64-bit value by 64 bits
- Rename device property valid_cs_bits -> valid-cs-bits to match
  standard DT/ACPI _DSD hyphen convention

v2: https://lore.kernel.org/all/20260805085414.1482-1-zhaoqunqin@loongson.cn/
v1: https://lore.kernel.org/all/20260730063035.230686-1-zhaoqunqin@loongson.cn/

Qunqin Zhao (1):
  EDAC/loongson: Add CS4-7 timeout filter for cross-node access

Wang Jinwei (2):
  EDAC/loongson: Encode node and MC info into mc_idx
  EDAC/loongson: Get DIMM size from ACPI _DSM method

 drivers/edac/loongson_edac.c | 82 ++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 8 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

