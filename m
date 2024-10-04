Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55021502C;
	Fri,  4 Oct 2024 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066496; cv=none; b=fnz0dd7Qn9nBV6+lboMKRRbDq+BPxeDzald8E7RKMFaXog0scpGumo/W4fSCgowkCZ6qUTA/Pmg5LU0bcLSxU+hmBeIjSnITd3wKubGYP2F5MzCSf3Jors3PU86nY7gdAP1d1Y+fCMuQQ17wncVUgrzMaa8fGePqt9GKm8ce0WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066496; c=relaxed/simple;
	bh=GDDV5dWyR0EA3ZKDqa7HCB32qQhj2xtV+yIkI0XifAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYiH3soXQlKUq8hawlGnYXjcbmJAwE24e8rHa+tpldOH2iemxDCZeERazf8rcy61n0G04xETatCHxy3qYeNfrmiDZcyXg1Fr+29a5FiIxAAVAjEJPuGNtNTbP8anEKMii07Ro8S0ljB0QMTUzHfoLmEULhwzWI0wl8EkQJn55xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXOdpNHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXOdpNHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EF5C4CECD;
	Fri,  4 Oct 2024 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066495;
	bh=GDDV5dWyR0EA3ZKDqa7HCB32qQhj2xtV+yIkI0XifAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MXOdpNHDQa1kQPPPV9fklhbvns4r4cL+L6KswVHsh8ExZ0tBp3l1OabtXS8nrhG5I
	 5jGF/+FHXOA8m68lEckW6fyaExV43zYSD3A8PImdQ1HdZvxGauCLzHDS723JG5fmYn
	 VXDfrmZGebk6qoV5ZAU2Xw1SdatX9xzhHFKBIwjXZMHhY/zAOXIEBkXwrhHtcHMlmx
	 TXfMHAyE6Wyt/E8A34VLXC2NmPxhojhkyIftz/qrLiShKrAayWCv7NGDzAG5TCU1EO
	 qfopX1f3x9FIEsmKmrRTTOOz4RaQn6gqlxk2jtjAPLBjd6acZSaeefpOvIY6vDurbe
	 7wOPNcsJAcaRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Wentao Guan <guanwentao@uniontech.com>,
	Yuli Wang <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Sasha Levin <sashal@kernel.org>,
	chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 32/42] LoongArch: Fix memleak in pci_acpi_scan_root()
Date: Fri,  4 Oct 2024 14:26:43 -0400
Message-ID: <20241004182718.3673735-32-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182718.3673735-1-sashal@kernel.org>
References: <20241004182718.3673735-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.112
Content-Transfer-Encoding: 8bit

From: Wentao Guan <guanwentao@uniontech.com>

[ Upstream commit 5016c3a31a6d74eaf2fdfdec673eae8fcf90379e ]

Add kfree(root_ops) in this case to avoid memleak of root_ops,
leaks when pci_find_bus() != 0.

Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/loongarch/pci/acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index 8235ec92b41fe..debd79f712860 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -222,6 +222,7 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 	if (bus) {
 		memcpy(bus->sysdata, info->cfg, sizeof(struct pci_config_window));
 		kfree(info);
+		kfree(root_ops);
 	} else {
 		struct pci_bus *child;
 
-- 
2.43.0

