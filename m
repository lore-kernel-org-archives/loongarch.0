Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDA2F659C
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 02:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766024191; cv=none; b=mXW9ft+6aqwAHFcT9zxFJrSr35ehY7z52QraHqN9X8j1KmN3Syd5G1f1VdlI+0FCjO0sF983pmOjNbymUJw61Wm5V6wV+wW7LNiL6J/WShTUr9o9lDvP2MzARVTXva7VxyroKXjzz7yzeS3gev9QVKg7k06EzIh/Y+r5GFb0Rmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766024191; c=relaxed/simple;
	bh=L5OZBikAi2AFvA+sOwLm34mMN7OohDsBcZp9v6sWfGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LtuUT3b+MaQLMSwLrx/M9DkcxJelPLqs4VmE+GMSI6oc8MIRpHFX4+s7aih87fxoqm+V2FgdwqB68KttQa3fyruMiDUhESJ5AB99sfCLBICAo3be7LVFZlpM9G+jPOS8NSYJCOwb+8mRQrPpt1OxDl5E4W2L+KEzjXYtx8a37i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dWv0T3PyTzYnWDt;
	Thu, 18 Dec 2025 09:56:25 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 09:59:02 +0800
Received: from localhost.localdomain (10.144.17.252) by w025.hihonor.com
 (10.68.28.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 09:59:01 +0800
From: yuan linyu <yuanlinyu@honor.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
	<loongarch@lists.linux.dev>
CC: <linux-kernel@vger.kernel.org>, yuan linyu <yuanlinyu@honor.com>
Subject: [PATCH 2/3] kfence: allow create debugfs dir/file unconditionally
Date: Thu, 18 Dec 2025 09:58:48 +0800
Message-ID: <20251218015849.1414609-3-yuanlinyu@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251218015849.1414609-1-yuanlinyu@honor.com>
References: <20251218015849.1414609-1-yuanlinyu@honor.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To w025.hihonor.com
 (10.68.28.69)

When add boot parameter kfence.sample_interval=0, it will not create
debugfs dir/file, but when user change this parameter after boot,
it can enable kfence, there is no debugfs info to check the kfence
state.

Remove kfence_enabled check in kfence_debugfs_init() to create debugfs
unconditionally.

Signed-off-by: yuan linyu <yuanlinyu@honor.com>
---
 mm/kfence/core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index 577a1699c553..24c6f1fa5b19 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -782,9 +782,6 @@ static int kfence_debugfs_init(void)
 {
 	struct dentry *kfence_dir;
 
-	if (!READ_ONCE(kfence_enabled))
-		return 0;
-
 	kfence_dir = debugfs_create_dir("kfence", NULL);
 	debugfs_create_file("stats", 0444, kfence_dir, NULL, &stats_fops);
 	debugfs_create_file("objects", 0400, kfence_dir, NULL, &objects_fops);
-- 
2.25.1

