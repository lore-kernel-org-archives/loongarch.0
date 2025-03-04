Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6551FCCF7
	for <loongarch@lists.linux.dev>; Tue,  4 Mar 2025 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085645; cv=none; b=O1whXekRaKcgwbdgOQwc6SbOq6+lxZxTztdwJ9wqHdA0z91L0udJ/VOXsgEW1YLBDsMhZU7PP9Di8DrFzZrebGMmGjDuLFdD98NKHqUgCooca4e1AkbZ5QQtCsXikA8x+5Rw8v+JNWHUXXmDas5wlTNm0XDIuTg2ol/7rYrOP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085645; c=relaxed/simple;
	bh=VCfucskRC2cvY6966shLxXr2SgNODQiP9tZAsdqtyxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WT2qQlE0cV2HSyOIet95OXZlS4i6NNkp1mVCXhiE1I3/vOgbxW0i3aVUf3Ms4mwuiYeSSU6+Is0KpH0teR2gCKcHCVwBlAZAXwi9OanTRf6Q93cFWWZEYMvSf57InCv4n+r4ob5hRVUJiFI3mhLh4zypPRPVzkaZ4tQk6M788+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OwwsFIKZ; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OwwsFIKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1741085591;
	bh=J+AbzbeKk1TMOXRqPTcIrGEKxdHexrILpO1xrigQbXw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OwwsFIKZ1SjdZY2GizjvL9BjFcNJe4DO2mxwtpweZyZUdf2lgxkz6ev1GdYBRhw6w
	 FBfvuX1XhDKnuEF27NSQjVpuu/hqnhseUBeSOyyusrkXOTWN4c/UO1Cs/UgMqqHGN6
	 kkLSQJynFfzIGWVrD3UAgkswGOb/Vy9xJsNiuuK4=
X-QQ-mid: bizesmtpip3t1741085573tvc43m9
X-QQ-Originating-IP: jfMFLMqo6HvurF85wH0TBlAZWnlJjGgvU5j6z2Ly9Yw=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Mar 2025 18:52:50 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6603146197274234106
From: WangYuli <wangyuli@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: yangtiezhu@loongson.cn,
	maobibo@loongson.cn,
	guoweikang.kernel@gmail.com,
	agordeev@linux.ibm.com,
	ast@kernel.org,
	usamaarif642@gmail.com,
	jiaxun.yang@flygoat.com,
	wangyuli@uniontech.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	chenlinxuan@uniontech.com,
	donmor3000@hotmail.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] LoongArch: Fix use of logical '&&' with constant operand
Date: Tue,  4 Mar 2025 18:52:46 +0800
Message-ID: <EEBE30D1ACFF646F+20250304105246.766404-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NmUbf62sSvqSp36iGJqg/vsXZS3AC+SxSYV4DSStO5VA+w05E4ueZdGe
	ZPdY7dpyZX/oXiTdqrbbaJFWwG/VPQ548m8OQjOjfY6XYdKh31O0/N6StLWD/fj0TcAUzHU
	r6xBaVLQtV3Dll8By9PxnOGMUiFKNgWWkK7OFpM5zpSIkyDlJ64T0/HTEhfvip/0OQ0H/1R
	B/3k1goL3CUlG2C/1EnekylRyPgJMuZ3lFwnegDEvEskix53wtc3OV6/4bYe7sxilnTtJup
	iAWNlIZ86dmipWQwUoq5S/vr+zKfa4ejZhEHPhz1akk4YKodJizm0fluBtOdQ8VNCXosDmd
	JWhAILk13wWmPa/9jpEpSd9kdmEuFGZeri3x4hHrHyBes6R28teGIEji6HVWCHE0HmDiDVO
	W4wyJ3/kPEVfdRmYGiFqhSarWyI3Gxya0/5iAiSlHcWwY+x2b3np9cO7M66jD6sKImOQYUJ
	aNU2nBxGlkLLOfMon7O4Xgbu5JW+ds5J/dexhChgAYmxUkpTiYzXDR7mIi2pgWIJwR5mFHz
	1/smT7K4gxXt42ngmC+wh7L6R0OZ6uUR+D6naZjUsL3b1YSQUzCRcqo3Tf2cnvJIIhyjELD
	Tj24IiGK76GA2H05ns8LJ6vLejHNrSXYpWhBqWHnpJUKXci+xWISaMCokCsqVDJrZ+r9MD4
	OyaVMq0tmxpkTA5Q8eg4O7zWs0Lyb0I2Ae4gBpK2tXepNrv98Y/d8aSczOiOMtEnZ7k8HZ5
	n/YWY0+itGYfGbC6cgeMa8D2Aj/hTNjmPgKqcKxHX0Opk5EKuoHF7xxYVFYxXmfxKDCicf7
	2rrO6ly/YJiMLS3/5jqzGHP6fxj9iwLK55HFmKiKZrwPCEXqLTLJ6gQd0jpfEJYvN6t0BXo
	T7ThlFQA+zpCnuhv8rE2Bjz8ux+AIojTMLJG57CM8oQ2Cme6862A3F3oio60bhjCXA/X/Rc
	dHMXqK2GgmMFcZli4Snowf2ZO9TmV1AW2NFUGYnADOcEYK2y/rAzE59DNyvE3uYz0wzqvkW
	Ig38uHg5nJ4VslRDtdZTosWOLgCsA=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

Fix follow error with clang-19:

arch/loongarch/kernel/setup.c:335:40: error: use of logical '&&' with constant operand [-Werror,-Wconstant-logical-operand]
  335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
      |                                               ^  ~~~~~~~~~~~~~~~~~
arch/loongarch/kernel/setup.c:335:40: note: use '&' for a bitwise operation
  335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
      |                                               ^~
      |                                               &
arch/loongarch/kernel/setup.c:335:40: note: remove constant to silence this warning
  335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
      |                                               ^~~~~~~~~~~~~~~~~~~~
1 error generated.

Fixes: 83da30d73b86 ("LoongArch: Fix CMDLINE_EXTEND and CMDLINE_BOOTLOADER handling")
Co-developed-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 arch/loongarch/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index edcfdfcad7d2..834bea7f42da 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -332,7 +332,7 @@ static void __init bootcmdline_init(char **cmdline_p)
 	 * Append built-in command line to the bootloader command line if
 	 * CONFIG_CMDLINE_EXTEND is enabled.
 	 */
-	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
+	if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && !!CONFIG_CMDLINE[0]) {
 		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
 		strlcat(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	}
-- 
2.47.2

