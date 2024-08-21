Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B0221C163
	for <loongarch@lists.linux.dev>; Wed, 21 Aug 2024 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222905; cv=none; b=ZJPe6O+8w08WrOZwZs2Ud20XJxr8/MVC6FVKqkVejfDs3WawkBdAL2jVchFkUo/Ox4O6F90KMz5RhpRLDrb3KB0n5GYD6ku62w1maOiiLsZwzjQ2zGMVRJ6/uKMcDhyJWGpw87bpEX4hRPXUrQnzWfHBtzp1GF9NalNIFJO5/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222905; c=relaxed/simple;
	bh=TnfqwPhCDzvHlQgyCowvuGGh7oEQuJ1Tf2kdo2IYJS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTBmGAjxUxoHR6eUaDdWLrLrlK11auCHfcidPxGbOyLUh/aaF/4K22qLPikZ96owXcgnzAvmPLgtvNXvfwb9nThb/FjZ83iNTkGtqZ29LNkW+6CKcQH1fkksiAkpUzEno9CkKmu2ojSQO5okQ14D5CUfJLiUkhgj/ClnYxJVwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.54.90])
	by gateway (Coremail) with SMTP id _____8AxSZqxjcVmSukaAA--.21238S3;
	Wed, 21 Aug 2024 14:48:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.54.90])
	by front1 (Coremail) with SMTP id qMiowMAxVOCxjcVmQVQcAA--.59935S2;
	Wed, 21 Aug 2024 14:48:17 +0800 (CST)
From: Zhao Qunqin <zhaoqunqin@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	bp@alien8.de,
	tony.luck@intel.com,
	james.morse@arm.com,
	mchehab@kernel.org,
	rric@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	zhaoqunqin <zhaoqunqin@loongson.cn>
Subject: [PATCH v1 0/2] Add EDAC driver for loongson memory controller
Date: Wed, 21 Aug 2024 14:47:26 +0800
Message-Id: <20240821064728.8642-1-zhaoqunqin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxVOCxjcVmQVQcAA--.59935S2
X-CM-SenderInfo: 52kd01pxqtx0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF18Kr47ZrWrJw17JF1UurX_yoWxKwc_Ca
	4xAaykGr4kKa4UGayYqr18ZrWaqFWjk3Z5C3Wqqw1rXw1avr13Xr4Du3W3Ca47JF4DWFnx
	ZrW8KF93Z3WUtosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8m9aDUUUUU==

From: zhaoqunqin <zhaoqunqin@loongson.cn>

These patchs are based on 6.10.4. Add a simple EDAC driver which report
single bit errors (CE) only on loongson platform.

zhaoqunqin (2):
  Loongarch: EDAC driver for loongson memory controller
  dt-bindings: EDAC for loongson memory controller

 .../bindings/edac/loongson,ls-mc-edac.yaml    |  35 +++
 MAINTAINERS                                   |   7 +
 arch/loongarch/Kconfig                        |   2 +
 drivers/edac/Kconfig                          |  10 +
 drivers/edac/Makefile                         |   1 +
 drivers/edac/loongson_edac.c                  | 208 ++++++++++++++++++
 6 files changed, 263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/loongson,ls-mc-edac.yaml
 create mode 100644 drivers/edac/loongson_edac.c

-- 
2.31.1

