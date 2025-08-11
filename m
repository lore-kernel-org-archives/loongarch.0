Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AC6198E81
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 02:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754878514; cv=none; b=OU687C3Z69XCLLIvn0irk1bxVUhVLZVo4hlvpmLuCK5dqbNXLQ0kws69axwoJ11xc545w5Xm0GvxrT0xMDAkH11ZyZQ4P71/FldI6zWSoXlUAQlZMc4wfJxVYHMKHN/OJ3BwhBoqDxWmzK7fnFNMMesCNNzook/WW6mUIdGLIaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754878514; c=relaxed/simple;
	bh=R3ZYPelq7B2wOcscDEbwM8RdfSfF7asWSOgJ1o3wNwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rSb14wDjJsdQO5Ko2QYDWjHLCSN9wQxbqQa3lWdgFhUBcacVOnQtjqgr+n3hQJu54mSUwUlqVx20GHxiNXRFqVR+vIRV+KlTARxPu3GQhnYab0djDIJAEg4Q4S4W4tUQPj9MdmMgfN8dBOsCUzaUIigVOrPwaytFBlEn8l6FL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxlnDcUZloqhg+AQ--.51717S3;
	Mon, 11 Aug 2025 10:13:48 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDxQ+TYUZloMZtBAA--.48509S7;
	Mon, 11 Aug 2025 10:13:47 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] LoongArch: KVM: Add address alignment check in pch_pic register access
Date: Mon, 11 Aug 2025 10:13:44 +0800
Message-Id: <20250811021344.3678306-6-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250811021344.3678306-1-maobibo@loongson.cn>
References: <20250811021344.3678306-1-maobibo@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+TYUZloMZtBAA--.48509S7
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With pch_pic device, its register is based on MMIO address space,
different access size 1/2/4/8 is supported. And base address should
be naturally aligned with its access size, here add alignment check
in its register access emulation function.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/pch_pic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 0710b5ab286e..5ee24dbf3c4c 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -151,6 +151,11 @@ static int kvm_pch_pic_read(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 	}
 
+	if (addr & (len - 1)) {
+		kvm_err("%s: pch pic not aligned addr %llx len %d\n", __func__, addr, len);
+		return -EINVAL;
+	}
+
 	/* statistics of pch pic reading */
 	vcpu->stat.pch_pic_read_exits++;
 	ret = loongarch_pch_pic_read(s, addr, len, val);
@@ -246,6 +251,11 @@ static int kvm_pch_pic_write(struct kvm_vcpu *vcpu,
 		return -EINVAL;
 	}
 
+	if (addr & (len - 1)) {
+		kvm_err("%s: pch pic not aligned addr %llx len %d\n", __func__, addr, len);
+		return -EINVAL;
+	}
+
 	/* statistics of pch pic writing */
 	vcpu->stat.pch_pic_write_exits++;
 	ret = loongarch_pch_pic_write(s, addr, len, val);
-- 
2.39.3

