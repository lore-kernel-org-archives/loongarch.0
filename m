Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42133E7BD0
	for <loongarch@lists.linux.dev>; Wed,  5 Aug 2026 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920954; cv=none; b=Hwb6WmHcC6r2WNGbXwk0b1VdDuJzcApVU32ojlTu8w+vH2CUl1oWdFTo6gP698QYlQ5x8eZ3n7ByHc8MvZGbV6uSlAX8GpZU/mp0fn9qHIuq+DBVeOOubIvXTcH/LQAsE8xCnTkaePC6Ys71RbxYWyyyQGkThe+nZuViOEuwMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920954; c=relaxed/simple;
	bh=NmM88NINLb/ASdCHL6bGaPRXrnlYX+Lzr3QVcXwPwv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdfm7HEyfAL8mriVpuLUOCimbjMkNhWmC1BQGqLPvwXRxAVIvcaVc0/vbtK8i2XmRtV7AmO5CWGM/8BIGIgRzvREIAtGWzdCUZl3mnxF3E9cDuhDlZoZ3ljqtqKy4zdd8KaLSk8vJ2E2sy/K+WaOPH2pvCRF6k0CfX9RpLo3aYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.123])
	by gateway (Coremail) with SMTP id _____8Bxmuu2_XJqSJgKAA--.34200S3;
	Wed, 05 Aug 2026 17:09:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.123])
	by front1 (Coremail) with SMTP id qMiowJBxEuSx_XJqe4okAA--.973S2;
	Wed, 05 Aug 2026 17:09:05 +0800 (CST)
From: Qunqin Zhao <zhaoqunqin@loongson.cn>
To: bp@alien8.de
Cc: tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	chenhuacai@kernel.org,
	Qunqin Zhao <zhaoqunqin@loongson.cn>
Subject: [PATCH v2 0/3] EDAC/loongson: Improvements for Loongson EDAC driver
Date: Wed,  5 Aug 2026 16:54:11 +0800
Message-ID: <20260805085414.1482-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxEuSx_XJqe4okAA--.973S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr4xZF1fKw17KrWrGF18CrX_yoW8ZFykpr
	W3ua98tr4qqrn2k3sayw12v3Z0k395Jr4DXan2qw18Zr13Z34UXr4SyrW5uFnrAr48tr15
	Wa4jgFn3WFWDJ3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

This series contains three patches for the Loongson EDAC driver:

Patch 1: Encode node and MC info into mc_idx so that on multi-node
systems, sysfs entries uniquely identify each controller.

Patch 2: Get DIMM size from ACPI _DSM method instead of using hardcoded
values, enabling correct display of memory size in sysfs.

Patch 3: Add CS4-7 timeout filter for cross-node access on 3C6000
multi-node systems to prevent false CE error reports.

Changes in v2:

Patch 1 "Encode node and MC info into mc_idx":
- mc_per_node -> mcs_per_node
- Use char other_detail[64] = {0} and drop the else branch
- Put snprintf() on one line
- If the definition of pvt_init is placed on a single line, it will
  exceed 100 characters, so the line break is kept.

- Use a temporary u32 variable for mc-idx to silence incompatible
  pointer type warning from device_property_read_u32(). Then keep
  the 'else' branch.
- Validate mc-per-node firmware property is non-zero to prevent
  division by zero

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

v1: https://lore.kernel.org/all/20260730063035.230686-1-zhaoqunqin@loongson.cn/

Qunqin Zhao (1):
  EDAC/loongson: Add CS4-7 timeout filter for cross-node access

Wang Jinwei (2):
  EDAC/loongson: Encode node and MC info into mc_idx
  EDAC/loongson: get DIMM size from ACPI _DSM method

 drivers/edac/loongson_edac.c | 84 ++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 8 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

