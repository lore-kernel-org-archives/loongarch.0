Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEBC78F4F
	for <loongarch@lists.linux.dev>; Mon, 28 Apr 2025 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812157; cv=none; b=B/D5fTrW4OBFbwFX67eootnIhjb4wAK1b0aKqIWz2VXYnOMxyf07MkCVVDruB0xV8iRhJOcJBZ9kuwZvUgCTWZPr6aaHfdEdzRO6mekzz7IWjw4as4umLOdvDMxSliTwgRiXca2dvy14hbpgeCz6YdxEDc/xBd49P21pukY1mIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812157; c=relaxed/simple;
	bh=mrO0sX0AxY9NPTt5ghapA/2o2ZwZKknZIzyQtCGodvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNi0eOqd8Z/M0YHugfsHoTNuKN2w+hLE8BCblRCNdZy9bqebzC5fqWbyLa4wFLnjJkc0nAWSOwSPqQaKT66v7LVhs+Hc36KEo9NULDo3ba25y0ZVanaLzx0I5mSU4AfTFa58C3Q7YCme9SgoH/+fkZ5j2rRFVpK2jg278T0kMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nuJQVH2P; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nuJQVH2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745812078;
	bh=WpqtUOShDe+d+QdRjkjQdxIWTys7H+1vGp8ynPDL/AA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nuJQVH2PQS5/69zXBh4PnF3UDE5R8oLUCgUx8yL758vK3lMufCNhRC6CbbOonU8Wp
	 Q62G9HkzzRYk0aN5TLItLI0P+eKCxciKBDK6jZsrzzN81q//6bq8/GmdyuyZUDy3SG
	 hj5voa6d5ZKYLYPtpfedz+xWwSDqdUkxRfTwyALc=
X-QQ-mid: zesmtpip4t1745812071t19a885c9
X-QQ-Originating-IP: uJ10WdG01LcOglQJft41t6kJrx/BDcIqge5YsKhZL08=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Apr 2025 11:47:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12876822068157501382
EX-QQ-RecipientCnt: 18
From: WangYuli <wangyuli@uniontech.com>
To: corbet@lwn.net,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	paulmck@kernel.org,
	thuth@redhat.com,
	bp@alien8.de,
	ardb@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] Documentation/kernel-parameters: Update memtest parameter
Date: Mon, 28 Apr 2025 11:47:46 +0800
Message-ID: <0FC3D21CA22E8251+20250428034746.21216-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MjqaYNLY8QZGLBaPpIBOLtwPvPGjnNSEoI8HyzG5vgbOOeLGckzgnGNF
	Gi2e+SlHSWjG65PMFv7qjK2/8wKHEG9y8PpHqaKvbekLUs0N2hKq/Fg7Q3Y/WZqiBVZSd85
	9wutTQQ4ZKO7MsCtBtsp8st8E3ooR1+y9TKZ6+huTTzuWmm4uBJooZZ5iKydwk1u8v/5G/4
	hskYvogmbBO+ocpho0zm55Vv6GSZtZ3n/IXJQ46pg6wiXedBsqj36xQ72d9GZtVyoirfiYi
	drqr8ZOqUXA4r8Tkzx9cMRZBUoJ3fqC/FO8ZvRmmkwIN3LX877WZ8ULefXUka102f19i2so
	7hnRyzLhUdUcelTtC9xH4BRFjHVvKd+loOuL4Mk2U605OUEPTWSfzfBgPAIbhBrQhZeBgIR
	C6F7kbpEA9UrQrJt1CJe9paHIo1nYkJa9zieukZVym1FujhyKeX0/Md/DvUAPyVLW8InQ+k
	mvhlTPCNQgHkjfM5K7Df4GabQrokV6iU08lgNVAir8c4pNVc5jorTmwf/1vhCfZkJeOyiWs
	lIiEzp4Xu+FcpAVKUjyj+7M9AjOU3MSjx5t83jXuNGY7bFaFqTlhZsDKUz+C4EsOLg16W9F
	g8q+es8+Y9ICnQJ9pVh5Wsq076a8F12V+p42NG9zj+30Be8xJ+Live1ifW3WgNPQdeBKPSo
	a6U8s3hxqL2bLJCqicUXgz2P+9YetRWlQ3S5N9ByXv0sYx6FNn7Y6w23e3S1yVuN9V7lDMi
	IbzKq6DAYYXWNdC9z2A5AF++Jc/XAPlPW7cQq+SrlSzArWr+Px86xgqMtJLU3Kpf+GMcZLF
	lDznjj2t3ZndNGcfPRjy5GZoaHyEGgOGFfPsCN1Lxtz0GvllH9RyZ1uBhd6JFSB5fL2HkhF
	mlKh3+YPTOnQOmcOEi6yYUtchyZjb8kWtkrM5/Smz8sk18yROSFvlmY/T367QbUCiRJN9/Z
	9doUVlCWLdJdmbS5nCKoRGE5RFiuN0Fkfmgd4Z6+BAH3FKkbyWAtBAYOyV3CUEHIv0Os=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

LoongArch, MIPS and XTENSA has supported memtest now.
Update documentation for them.

Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dce44566192ec0b38597fdfd435013c2d54653ff
Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fb8e9f59d6f292c3d9fea6c155c22ea5fc3053ab
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..eeba55deb38d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3620,7 +3620,7 @@
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
-	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
+	memtest=	[KNL,X86,ARM,LOONGARCH,MIPS,M68K,PPC,RISCV,XTENSA,EARLY] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
 			Specifies the number of memtest passes to be
-- 
2.49.0

