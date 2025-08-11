Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7810619F111
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754878438; cv=none; b=hvJK3dTHDscztQ7Lc0ymRidH1t14geReT+wj8VaFCnVEHj+J5AkLv1wklwCgOc0CnAmmiWkT+vWF9tVAJPnHTLGCsHqFALE2ENnBq2nh9LQGrsAJ69hRUmoz1vWWBUde+QC7RGLCRtQW3IterRl7IEy20oa97SYWcM7MgwN7GW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754878438; c=relaxed/simple;
	bh=yhCPk/afV0DT8k1q58coV6ibSQtTlsNl6zwwhFxWqi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QDP2JOL8w60F9YqtB06Js0+pKYOhV4KNEg+1LFjW1stI8P5xQysmJg2dqkwJto5M+2drHNSoPoCkbSb2IBtIBxvNIs8n+1dY6rOF8Vm5CsQd5VTbvIoOhUMpH0Mx3cnRX0sO7uaCQ+ZCEglhX+AGhUIUPrweX16vfzggsboIy/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8BxLHLaUZlonxg+AQ--.17943S3;
	Mon, 11 Aug 2025 10:13:46 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJDxQ+TYUZloMZtBAA--.48509S4;
	Mon, 11 Aug 2025 10:13:46 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] LoongArch: KVM: Add read length support in loongarch_pch_pic_read()
Date: Mon, 11 Aug 2025 10:13:41 +0800
Message-Id: <20250811021344.3678306-3-maobibo@loongson.cn>
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
X-CM-TRANSID:qMiowJDxQ+TYUZloMZtBAA--.48509S4
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

With function loongarch_pch_pic_read(), currently it is hardcoded
length for different registers, the length comes from exising linux
pch_pic driver code. In theory length 1/2/4/8 should be supported
for all the registers, here adding different length support about
register read emulation in function loongarch_pch_pic_read().

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/kvm/intc/pch_pic.c | 42 ++++++++++++++-----------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index 2c26c0836a05..70b8cbeea869 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -118,61 +118,57 @@ static u32 pch_pic_write_reg(u64 *s, int high, u32 v)
 
 static int loongarch_pch_pic_read(struct loongarch_pch_pic *s, gpa_t addr, int len, void *val)
 {
-	int offset, index, ret = 0;
-	u32 data = 0;
+	int offset, ret = 0;
+	u64 data = 0;
+	void *ptemp;
 
 	offset = addr - s->pch_pic_base;
+	offset -= offset & 7;
 
 	spin_lock(&s->lock);
 	switch (offset) {
 	case PCH_PIC_INT_ID_START ... PCH_PIC_INT_ID_END:
-		*(u64 *)val = s->id.data;
+		data = s->id.data;
 		break;
 	case PCH_PIC_MASK_START ... PCH_PIC_MASK_END:
-		offset -= PCH_PIC_MASK_START;
-		index = offset >> 2;
-		/* read mask reg */
-		data = pch_pic_read_reg(&s->mask, index);
-		*(u32 *)val = data;
+		data = s->mask;
 		break;
 	case PCH_PIC_HTMSI_EN_START ... PCH_PIC_HTMSI_EN_END:
-		offset -= PCH_PIC_HTMSI_EN_START;
-		index = offset >> 2;
 		/* read htmsi enable reg */
-		data = pch_pic_read_reg(&s->htmsi_en, index);
-		*(u32 *)val = data;
+		data = s->htmsi_en;
 		break;
 	case PCH_PIC_EDGE_START ... PCH_PIC_EDGE_END:
-		offset -= PCH_PIC_EDGE_START;
-		index = offset >> 2;
 		/* read edge enable reg */
-		data = pch_pic_read_reg(&s->edge, index);
-		*(u32 *)val = data;
+		data = s->edge;
 		break;
 	case PCH_PIC_AUTO_CTRL0_START ... PCH_PIC_AUTO_CTRL0_END:
 	case PCH_PIC_AUTO_CTRL1_START ... PCH_PIC_AUTO_CTRL1_END:
 		/* we only use default mode: fixed interrupt distribution mode */
-		*(u32 *)val = 0;
 		break;
 	case PCH_PIC_ROUTE_ENTRY_START ... PCH_PIC_ROUTE_ENTRY_END:
 		/* only route to int0: eiointc */
-		*(u8 *)val = 1;
+		ptemp = s->route_entry + (offset - PCH_PIC_ROUTE_ENTRY_START);
+		data = *(u64 *)ptemp;
 		break;
 	case PCH_PIC_HTMSI_VEC_START ... PCH_PIC_HTMSI_VEC_END:
-		offset -= PCH_PIC_HTMSI_VEC_START;
 		/* read htmsi vector */
-		data = s->htmsi_vector[offset];
-		*(u8 *)val = data;
+		ptemp = s->htmsi_vector + (offset - PCH_PIC_HTMSI_VEC_START);
+		data = *(u64 *)ptemp;
 		break;
 	case PCH_PIC_POLARITY_START ... PCH_PIC_POLARITY_END:
-		/* we only use defalut value 0: high level triggered */
-		*(u32 *)val = 0;
+		data = s->polarity;
 		break;
 	default:
 		ret = -EINVAL;
 	}
 	spin_unlock(&s->lock);
 
+	if (ret)
+		return ret;
+
+	offset = (addr - s->pch_pic_base) & 7;
+	data = data >> (offset * 8);
+	memcpy(val, &data, len);
 	return ret;
 }
 
-- 
2.39.3

