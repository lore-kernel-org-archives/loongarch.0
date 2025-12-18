Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C32F6910
	for <loongarch@lists.linux.dev>; Thu, 18 Dec 2025 02:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766024191; cv=none; b=nQ/VYStMCyR3NMJ00pulkXLjLOvF7VNOwTVp+yLB/FVlV8hx7LpJeqJVMJcDUDirZ0U3+H8c3flxoD89QvXwUpojRE3WpmB8sjK6ygwh6xgOHz2XD4KWCVFl1y/GUcEu7V+F3GoBqmLCQ99tjsfSFO7/G5Z4wPE54nHtqqiuee8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766024191; c=relaxed/simple;
	bh=0XGZMuYs3aswHuhaS+lGGdQGKZHlvktqBNsXj0stAfA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e4jWYj5fFD5jSwWdUc04iJktkos2nXATeUB3DWfO140g9/FeuPVQS4pecqMcEOpO6fSo3YcMlhwFtpMTNcgW679wnOGYtFdYKIJBSP2CwZWeefBq3b3LhtQVuj1vfCroddw87pP8onX4lwl7EadraniQKkROpd0RneQVGLf66j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dWv0T0yGbzYnWDP;
	Thu, 18 Dec 2025 09:56:25 +0800 (CST)
Received: from w025.hihonor.com (10.68.28.69) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 18 Dec
 2025 09:59:01 +0800
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
Subject: [PATCH 0/3] kfence: allow change objects number
Date: Thu, 18 Dec 2025 09:58:46 +0800
Message-ID: <20251218015849.1414609-1-yuanlinyu@honor.com>
X-Mailer: git-send-email 2.25.1
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

patch01 use common KFENCE_POOL_SIZE for LoongArch
patch02 always create kfence debugfs dir/file
patch03 allow change objects number

yuan linyu (3):
  LoongArch: kfence: avoid use CONFIG_KFENCE_NUM_OBJECTS
  kfence: allow create debugfs dir/file unconditionally
  kfence: allow change number of object by early parameter

 arch/loongarch/include/asm/pgtable.h |   3 +-
 include/linux/kfence.h               |   5 +-
 mm/kfence/core.c                     | 125 +++++++++++++++++++--------
 mm/kfence/kfence.h                   |   4 +-
 mm/kfence/kfence_test.c              |   2 +-
 5 files changed, 98 insertions(+), 41 deletions(-)

-- 
2.25.1

