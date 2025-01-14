Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCFC237A3B;
	Tue, 14 Jan 2025 06:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736835325; cv=none; b=lw8K8trlnwcxiijYFxwrhWR3FqD1VDXyvEcbbch/BAQ+6OtpN1bd3xGmdcszXUi98iPVrS9lI9yExC4JrOszOEJHswoFmNN60wG61wPM6MwdFokjVEzob7K/AsRWUfBOvkGd9779fu4g4bHO9Mv8coCL9LRaH1ZdO8fB531XFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736835325; c=relaxed/simple;
	bh=uz/oZNt0jL5EljtpHCwDPYbt3ysO8JBrp/5j2/AA1ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncjX6JSl1yzd6rfeNsv7wMDHLPJvK61OMGdlfRiK1+Uv+CARTh6t7SzPrDvNigIsdX3rhajYK34jswH7opFautlKRG/nA/zXEJ2RwC/YSG3oWOVDGuJ39JHgZ8fPfEmsRS6gYOc0AiboX7bodfBdkQy4DwZcfJEuPtq683tkN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxUa_wAIZnxQpjAA--.63559S3;
	Tue, 14 Jan 2025 14:15:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDx_8fuAIZnaqEhAA--.2237S2;
	Tue, 14 Jan 2025 14:15:10 +0800 (CST)
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
Subject: [PATCH v3 0/3] drm/amd/display: Stop control flow if the divisior is zero
Date: Tue, 14 Jan 2025 14:15:07 +0800
Message-ID: <20250114061507.30765-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_8fuAIZnaqEhAA--.2237S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrW5WF1xJFyfJr45tF17CFX_yoWDuFg_Kr
	48XF93tw1jqa9IvFWYyF4fuFyYg3yUAr4ftFy8K3yvvFyfGw4UWa4UGrWkAr18Z3W2yFZ8
	ury8KF15AwsrGosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU866wJUUUUU==

As far as I can tell, with the current existing macro definitions, there
is no better way to do the minimal and proper changes to stop the control
flow if the divisior is zero.

In order to keep the current ability for the aim of debugging and avoid
printing the warning message twice, it is better to only use ASSERT_BUG()
and SPL_ASSERT_BUG() directly after doing the following two steps:

(1) Add ASSERT_BUG() macro definition
(2) Add SPL_ASSERT_BUG() macro definition

This version is based on 6.13-rc7, tested on x86 and LoongArch.

Tiezhu Yang (3):
  drm/amd/display: Add ASSERT_BUG() macro definition
  drm/amd/display: Add SPL_ASSERT_BUG() macro definition
  drm/amd/display: Harden callers of division functions

 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h           | 5 +++++
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 9 +++++++++
 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c | 2 +-
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.42.0

