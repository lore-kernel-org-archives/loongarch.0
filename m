Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575959;
	b=nwBRiBHEhKSEJ+PJZ7E+Za9YJQhfiNbCEhJmwugG2XnkVSEsuVODKTlHqwbV98Q167Js
	 4iK/UsK4mCvK0SX4nKlH9+MDf1mNnxVBJtqeV9vwUUAx1t0ilSKEDsBSqf3TpdIzvbKSX
	 rciv2B0lilsQzEXky3+osvsJ5Fg7V0Ga5n7PZvYF61e77pSfyNTsN/+peif+HNDQeBWue
	 JKsydVgPMBcAk21plvHQuxLOzsECTk1tMJudxGytCTe1hTLC/ghQ/rR98v9Ka2foISYBz
	 c2E/D8DsgMH/AUvSewH4f3YnwYeNdj+odhIv1MAaWsSg+n0w8RfpDqdNXuLuGsuDJsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575959;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Aa+Ay1/zkX9mW1dHapCcJ29KkN3LrR+HogZO/SC57M4=;
	b=MUHuggQbR3EpCNuHFDDV26HO39V3eIAQekRwzttAnp4OqCdYnb9XC6Q1wklCmbt964Zc
	 MWiBY2SdV7maIktPXhIxElrwv/3CPErrxatNyYciHIkF6ZmimfxG0PCNZdoA8jYG2+KhL
	 mhsg+PAXsRzop9VrXCxL+EEsIMMF976H+NJp4vnW4kwoLGAG8aDP++q6nq6mHw0Mcjxe1
	 OwM7m03X9u8QHsQmaB6lA9HVTe7nri6bC0f3FpPxY/c4kJrdHxMShv5vHI9DdLMCEyxrQ
	 VY7ewkYze6AmqU38jDlfKrd1B82MfLtJjeNJb3tMzMD74SzjgVKTzi4ohRuPZ8DaXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BwjQlAo3;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF460A262D;
	Fri, 13 Nov 2026 13:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85FF460A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=BwjQlAo3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794575949;
	bh=Aa+Ay1/zkX9mW1dHapCcJ29KkN3LrR+HogZO/SC57M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BwjQlAo3LP5/9O8aYqc8iir985kQXJphrvkxKSX6WMEBk2P8Uj1wC+ES6Q9U5yjCc
	 kfzBHW4ky7CnbsIvv6sL6aqYizwNscb+MuzkiBZ4CVqc2QmoWC74Hil99Gka7InJ8w
	 WjEtGpv1Sk1S0QJLdMffA+QolJYPlIiCjbL2XJwPT5m/AAFmMOUuTT/aux+wol9Im+
	 ntMtSPodsJ+i9VdYiXA5fb1wGFs9lak33v0MAvwj18n37WjbCaYDix/byQt4sQSfyA
	 K3jaG/90Ic5SLIZtaMIsH8ZB3yMyuTjyzfQNHmtuzuihy3Ypuh8bdlSq2Up7g9ZqYp
	 TAnnGGRfwsuiw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jQyWx39HJzQ0V;
	Fri, 13 Nov 2026 08:19:09 -0500 (EST)
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
	linux-trace-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [RFC PATCH 04/16] selftests/membarrier: Issue the sync core command in its test
Date: Fri, 13 Nov 2026 08:18:51 -0500
Message-Id: <20261113131903.157186-5-mathieu.desnoyers@efficios.com>
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

test_membarrier_private_expedited_sync_core_success() is meant to
check that MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE succeeds after
its registration. It issues MEMBARRIER_CMD_PRIVATE_EXPEDITED instead.
No test issues the sync core command with success.

Issue the sync core command.

While at it, pass the third system call argument. It was left
uninitialized.

Fixes: 460e8c3340a2 ("membarrier/selftest: Test private expedited sync core command")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 tools/testing/selftests/membarrier/membarrier_test_impl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index b4dcbb32538d..4b9d1771916e 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -13,7 +13,7 @@ static int registrations;
 
 static int sys_membarrier(int cmd, int flags)
 {
-	return syscall(__NR_membarrier, cmd, flags);
+	return syscall(__NR_membarrier, cmd, flags, 0);
 }
 
 static int membarrier_get_registrations(void)
@@ -221,7 +221,7 @@ static int test_membarrier_register_private_expedited_sync_core_success(void)
 
 static int test_membarrier_private_expedited_sync_core_success(void)
 {
-	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
+	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, flags = 0;
 	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE";
 
 	if (sys_membarrier(cmd, flags) != 0) {
-- 
2.47.3

