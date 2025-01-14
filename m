Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B130C232436;
	Tue, 14 Jan 2025 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861343; cv=none; b=L3Z8wA0LhWJj4bcsUVDsBqxobFUAs+x2rSZqmGdewOo0Oq2G2oy74okabpEgsjhbtMnWKZOA84pUoxRrDm/WVp62/+EiYm5vTfn5aZ+QQ0mZaMfZKcIGtVW2kdXyZM/ZrK52+oCxA/7rMYa2tp2s4D6OrbxeyA1ReqFsde0Oa1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861343; c=relaxed/simple;
	bh=ZGDriMazfpWBilmxCKeVttWcJ1GnNTVU4YbhTTr6Cwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnorS+J5drRLTsGiCny8/RzeNW5sLet1LXGLyWPYhVhK2BuV06HGJRdlvI6EVj6/URceAG755exrOkiNxNNSJQU+u/rdYgM37AqZdamcxD2m0tgGZM0JuisbJC8kJgbXtxpdAIforGGY0lsRsp0mj/XRqQRs1r7n0/O727HtQy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Ax6+GaZoZnbzxjAA--.62923S3;
	Tue, 14 Jan 2025 21:28:58 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxncWZZoZncSUiAA--.3105S2;
	Tue, 14 Jan 2025 21:28:57 +0800 (CST)
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
Subject: [PATCH v4 0/3] drm/amd/display: Stop control flow if the divisior is zero
Date: Tue, 14 Jan 2025 21:28:56 +0800
Message-ID: <20250114132856.19463-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxncWZZoZncSUiAA--.3105S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrW5WF1xJFyfJr45tF17CFX_yoWDtrc_Kr
	W8XF93tw1Uta9IvFW2yF4fuFyYg3yUAr4ftFy8K3yvvFyfGw4UWa4UGrWkAr18Z3W2kFZ8
	uryUKF1rAwsrGosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jFa0PUUUUU=

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

 drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h           |  7 +++++++
 drivers/gpu/drm/amd/display/dc/spl/spl_debug.h      | 11 +++++++++++
 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c |  2 +-
 4 files changed, 20 insertions(+), 2 deletions(-)

-- 
2.42.0

