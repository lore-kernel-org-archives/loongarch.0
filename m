Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C62F6195
	for <loongarch@lists.linux.dev>; Fri, 14 Nov 2025 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763133302; cv=none; b=JiwuV2uilOFbcBmqREeuWpYTTydfx6JVhWrgoifMocpOse5lq+qsoHTjJ37t3TdLktaoVejXpkCf9dJ5YvjZQoKt0EvxM/f4AoqnhPeWt6jO69rP+nK6eh7JkkxJIWLaGMAoOAjUO27/8qaZCmdcD5lXNEi0wew313wvoVYtL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763133302; c=relaxed/simple;
	bh=ZGFNntgSflJVhOXYJ02XlQ2RYuItBnLdIXYmR6xh+/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFVn5K1anonMdQbOhTHMUbvd5kD+OET5mBrMWp/IzZVCUpIOkM+7kSU9L1gX3kG1LmYaquZsrnwYC+icNQCLZy7KlkfeIknMrBHH77rSRDweeU0ZB0GWvk+EvDkOJm4tjTyC48da7yEh+z/TwZCluN+C/kjMWWXiOV4RJmHx30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AD/23y/g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AD/23y/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKNAHPDAvmAC9QequSTQUruQa42RH3SMYJaJvkkmTRU=;
	b=AD/23y/g5bu/BT/vFRvRra11SeNWHAg13Px/tWe89uqV/yR4CG4hhJ8cnsLuaDxL63+kzg
	jPmUOsbCm6ATUUo/bACiSxSVG2JGjy7KC6dvEv/3H8az9NvP9HwP6cCTdP6NXuJ5Kd6+uc
	uICrE6Fgl3lHX7M4NMO2FDUi5g8uj8g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-7iDwu_fMODCphb54CSyEig-1; Fri,
 14 Nov 2025 10:14:58 -0500
X-MC-Unique: 7iDwu_fMODCphb54CSyEig-1
X-Mimecast-MFC-AGG-ID: 7iDwu_fMODCphb54CSyEig_1763133293
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 796421956088;
	Fri, 14 Nov 2025 15:14:53 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1DFC2180049F;
	Fri, 14 Nov 2025 15:14:37 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 21/31] stackleack: Mark stack_erasing_bypass key as allowed in .noinstr
Date: Fri, 14 Nov 2025 16:14:18 +0100
Message-ID: <20251114151428.1064524-1-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

stack_erasing_bypass is used in .noinstr code, and can be modified at runtime
(proc/sys/kernel/stack_erasing write). However it is not expected that it
will be  flipped during latency-sensitive operations, and thus shouldn't be
a source of interference wrt the text patching IPI.

Mark it to let objtool know not to warn about it.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/kstack_erase.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/kstack_erase.c b/kernel/kstack_erase.c
index e49bb88b4f0a3..99ba44cf939bf 100644
--- a/kernel/kstack_erase.c
+++ b/kernel/kstack_erase.c
@@ -19,7 +19,11 @@
 #include <linux/sysctl.h>
 #include <linux/init.h>
 
-static DEFINE_STATIC_KEY_FALSE(stack_erasing_bypass);
+/*
+ * NOINSTR: This static key can only be modified via its sysctl interface. It is
+ * expected it will remain stable during latency-senstive operations.
+ */
+static DEFINE_STATIC_KEY_FALSE_NOINSTR(stack_erasing_bypass);
 
 #ifdef CONFIG_SYSCTL
 static int stack_erasing_sysctl(const struct ctl_table *table, int write,
-- 
2.51.0

