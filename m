Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE6653A5
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 18:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E0EC43143;
	Thu, 29 Sep 2022 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664474853;
	bh=tsNHIVz2bAykv1iQnDepJXwzecgKcOX8Fgq5w5CP064=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJzKhQtLtpOeEj0ZAvRdcHmT4naJUMBbhcNQvTNnhYwc872HGpDqqLBKyGfIvBuz4
	 DQnhGqzq8YSJ9Q91uvV/uNuf8V15AYJOwQszx6DfhmQfGXBA5cVXP7B09g1c6O44Rf
	 gLxIGw15TPvh5GsHzbeZpuB8tvjgPiKA+usaLlAVbo8TX10v5Jm4EcZDStwQ2VdykC
	 Kf0LGh1OS522Yr9zNKyKjrXjkqpVksONf3vYz2YWotRCOsE9MRaXr4s9wjd2t8xxQN
	 NPAlLJBhEpCHJTk+im521Nzn4eq6n0q9N68dGWY2w6SblAup0wKfjagyyhvuE/KlRf
	 7gzBxnZXIHNgg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B6F0D5C0F30; Thu, 29 Sep 2022 11:07:32 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@fb.com,
	rostedt@goodmis.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <quic_neeraju@quicinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Petr Mladek <pmladek@suse.com>,
	loongarch@lists.linux.dev
Subject: [PATCH RFC v2 rcu 7/8] arch/loongarch: Add ARCH_HAS_NMI_SAFE_THIS_CPU_OPS Kconfig option
Date: Thu, 29 Sep 2022 11:07:30 -0700
Message-Id: <20220929180731.2875722-7-paulmck@kernel.org>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20220929180714.GA2874192@paulmck-ThinkPad-P17-Gen-1>
References: <20220929180714.GA2874192@paulmck-ThinkPad-P17-Gen-1>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loongarch architecture uses the atomic read-modify-write amadd
instruction to implement this_cpu_add(), which is NMI safe.  This means
that the old and more-efficient srcu_read_lock() may be used in NMI
context, without the need for srcu_read_lock_nmisafe().  Therefore, add
the new Kconfig option ARCH_HAS_NMI_SAFE_THIS_CPU_OPS to arch/x86/Kconfig,
which will cause NEED_SRCU_NMI_SAFE to be deselected, thus preserving
the current srcu_read_lock() behavior.

Link: https://lore.kernel.org/all/20220910221947.171557773@linutronix.de/

Suggested-by: Neeraj Upadhyay <quic_neeraju@quicinc.com>
Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>
Cc: <loongarch@lists.linux.dev>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 4abc9a28aba4..c8864768dc4d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -10,6 +10,7 @@ config LOONGARCH
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-- 
2.31.1.189.g2e36527f23

