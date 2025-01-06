Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE7B1D6DDD;
	Mon,  6 Jan 2025 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154203; cv=none; b=S1z8ZdE6IUmD0OP65bFS61EWO3KnjeQPrs4VY/ME/lBWQy0uZbXNLEB26ya+jt+9Utft7l7h0vV+aEEuhXe4gMdfaxDfwvnk2KKxrB4/NbLalADQDk5yFkyLcCBW3BWGIi8dy2f+XKU70N8GnMg+lVtv3I2PTce0LULXt5Q3IgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154203; c=relaxed/simple;
	bh=uOvE5uvtUrPimmZjDM5zKfZP1LQpoTUdCebdlKOKMik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWi1Vh6R/P2MkYac25DcCkWmce7m1gXyc4coVjM5gk6FU+SjwWx5Plmoky/m+D4wbaAkQDPCNsbOpCRaLssv9TQl8QUz+e8WT8i1y5rAtPv0LqK+04h/EmoF+RdLuqSd1BEZA4SALYf+prgs944AcAB/POME1zUYA46cOYVt0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxWOFPnHtnFY9eAA--.54653S3;
	Mon, 06 Jan 2025 17:03:11 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAx7+VNnHtnkUkWAA--.31560S2;
	Mon, 06 Jan 2025 17:03:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/amd/display: Add ASSERT_BUG() macro definition
Date: Mon,  6 Jan 2025 17:03:06 +0800
Message-ID: <20250106090306.5579-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250106085755.3268-1-yangtiezhu@loongson.cn>
References: <20250106085755.3268-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx7+VNnHtnkUkWAA--.31560S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XrWfuw4UZrykZr1UWw4UGFX_yoWfXrb_KF
	48XrySqw1jyF1vgFy0yrWfuFyI9w4rur48WrW8t3sIv343Ww4DX3y0kr18Wr1fCF12yFZ0
	v34jg3WrA3ZrGosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz-eOUUUUU=

In order to keep the current ability for the aim of debugging and avoid
printing the warning message twice, add ASSERT_BUG() macro definition to
harden the callers of division functions.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 42f3712aef9e..13efefb24899 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -79,6 +79,11 @@
 			dc_breakpoint();	\
 	} while (0)
 
+#define ASSERT_BUG(expr) do {			\
+		dc_breakpoint();		\
+		BUG_ON(!(expr));		\
+	} while (0)
+
 #define BREAK_TO_DEBUGGER() \
 	do { \
 		DRM_DEBUG_DRIVER("%s():%d\n", __func__, __LINE__); \
-- 
2.42.0

