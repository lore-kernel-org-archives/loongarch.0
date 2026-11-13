Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575962;
	b=kSm+nmvFO4omnJ1ufbPKEEy2yX+Rr+ij5E3HoEj/kQ1mQ7hklFJb+lEpcNpCo0EcToEF
	 TbpOJy4MbRfXM4Xe7ewxH4hRuBnbBRzc5Q0vIiqAp4r6kp6lS0H/HjZmoabcAgh1mavCE
	 xP038RXW6UVT0dF9+lyCkm8yhUR7exEMKn/okzmJuL0NaR9+j1DkyyBDCgfC33aL0nV8X
	 w99119Fv2XZgPo/UiUZKnQB3pJsHJhzw+uptcMPVzNZs93h1LC01TcyDf6fm1mwHcOSMY
	 TzS2fay4ehNe2GfV0UYNs2gM2xjETvHVkSkO4QhnmzHc7gcgwgZc1idjTcxr3wzwiDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575962;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WHY+8I3fXBrwECRQRQwc27pmPFAuQe8kSc5abxVwo8A=;
	b=3ynxJh0oLymkfXrdBkscMEbRL/k7dqN462//EZ5B0C4w8Pghy22DDdORtO9Vr1wj2kP7
	 UnPMaP5S7a0fRg2aMUAsKsyMTwVhrRSNGbEOGXqgGqRVuToPZEZPyb6yNjheN9YAZeEbd
	 /VHKhPOXxhEabVIh8Poc6y7G9liX8cnoA5yCNWUnrOjejGtzNW02qLIOdhQxnaGpy8bd5
	 eDzhX/Wwlx7p9ibRhE6YrPgC68aVDJhdQ3FMYBt/spCeq8tHwjmG/Buc1QjObowSU8YZ0
	 BxhSesOaBijTu5Y1FNGie2cWuWtsv5aVtS6K4ui3NA77Kst1OeCmfYKETHvBafLiawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=bDJyICoo;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0592606B560;
	Fri, 13 Nov 2026 13:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0592606B560
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=bDJyICoo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575952;
	bh=WHY+8I3fXBrwECRQRQwc27pmPFAuQe8kSc5abxVwo8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDJyICooaKcDSek4/A4H+S+weKzQTQDleKQPO4COpfpcZOVV1ac9mO5nbp/hmwrV/
	 AQVk1PDb7U7fYHLenbjMC3xnAy+P3hSG5uUwUDSNq70We787UQx/ZaMiBNmRdwf7mw
	 VkZP66ATHNuO4m1MAB/whXO+4dOyg6pZ5NBUeexxKGMewN3gWdzbZ2XZqhthTNWHaX
	 kvWZ0bwRDCRd0Ll2L/8NqJziOZdv2kNu/7CkgPzI1mpqFslGSd03KSZDYdmxYBqorq
	 O9yAOCDKLLf1y6q155foRI21EXgT7N8THnQxxlukXlnQmMSf+y5BerbQYVD2ztJLX1
	 TIrv4ikp/QPeQ==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyX00WW2zQ2n;
	Fri, 13 Nov 2026 08:19:12 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Michal Clapinski <mclapinski@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Aniket Gattani <aniketgattani@google.com>,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Gellermann <christian.gellermann@codasip.com>,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-openrisc@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arch@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	lkmm@lists.linux.dev,
	bpf@vger.kernel.org,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org
Subject: [RFC PATCH 14/16] MAINTAINERS: Add the membarrier selftests to MEMBARRIER SUPPORT
Date: Fri, 13 Nov 2026 08:19:01 -0500
Message-Id: <20261113131903.157186-15-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
References: <20261113131903.157186-1-mathieu.desnoyers@efficios.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MEMBARRIER SUPPORT entry does not list the membarrier selftests.
get_maintainer.pl does not report the membarrier maintainers for a
change to these tests.

Add tools/testing/selftests/membarrier/ to the entry.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..2ee220ccc5e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17435,6 +17435,7 @@ F:	arch/*/include/asm/membarrier.h
 F:	arch/*/include/asm/sync_core.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
+F:	tools/testing/selftests/membarrier/
 
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
-- 
2.47.3

