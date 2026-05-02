Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74190336EF8
	for <loongarch@lists.linux.dev>; Sat,  2 May 2026 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720768; cv=none; b=UI/ceKr8ZpdKNF/g7thnadoqbenSnlZv0HwEfdD/IjP00lLXCX/k0hXaOdPBurr+6suvUTfE/qzfIpbdIJ+lG0FJ0bPLuonHW1FK24WZ7uMGas0UVW77r9KSDlg+xHdrDxibjzCWxV5eyX5M4vdimX9ICdKjwFlgfvaUp0iLFYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720768; c=relaxed/simple;
	bh=kot9EcZkqya3bNn90ZsGro7iAS4rkv0vasM61bUcOTM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=rA6oZjQ3EvV2PSZDm1p7jLd3XV5hoSbNWf9iYYqJ8RxpbDLjv6FpKxyFsF/zbljFGoqpovFp+cBxPO7Sq4r2Nb4tmNW/znOvFTbVQL+/wRoxQkXvigBZZ1elucxaJQIs/GijJSzpfASvjtjLr8qWd5zd0h6Y3czNPkN1cm5pBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=omQmEfnN; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="omQmEfnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777720756; bh=vlBpe8xOmP21cCjyDWJLXr5pIey0kkllLTvVSDzxoVY=;
	h=From:To:Cc:Subject:Date;
	b=omQmEfnNQKSdCa2w4NE4WUaC3tOq+zrGBBm7PWL+D3439wL1jqocMPwtOVWKw5OXR
	 uEcS9/qgFIxqGraitG+tZrqEQlQOEDuM8Hmc+mwtKFTvnQXSxWEqhvhQy2T5Ep/PTM
	 QGvAfshQPNZ5zbces+9uExTFyx4oOFpCLNPwPBT8=
Received: from Lang.smartont.net ([2409:8a44:2312:14e1:56d8:1e1e:3f0b:d0f3])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 4CC3A646; Sat, 02 May 2026 19:19:12 +0800
X-QQ-mid: xmsmtpt1777720752t1ckfyps2
Message-ID: <tencent_ADC4AD99CFC8EFB26D25889B11D4864B9B05@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznjPfiY4MuRVBcJ6etABYNKUM2juKBeQxK3TeEEgi3L8cacZYHZT
	 aFBqwtUy1ktDlyqLYd3urhIhOraDdeXMUWk5oCHgxCiQ0OleG+PDdwRwfjT64DcHDAGuRC8Qf2Pc
	 KDADfJHSmeQCDKkav3LMoz8XF0eGGC+rfg6Z2FxOuZC+gd6E0S3eErUXJLzJsolxnAOGjSxQDULM
	 FNNNXxpBbRGe3bPtXzBw6V5feHnLaUZN7bn9Jxi9eewNSTppcJX6itbF31suiTT8NWp6uAbz+9u4
	 wZMdpN3ms/tyAf0rH/av6+JJV8bKNCWo53csxT+0G47TntXRfJGv9z0kOca5ZbPrrN0uR3HrEmVe
	 wVt3QjKL2wTPqXI5RGeKRhsmWIUqDl/gW9Bk/aRk16FeH0PQ3G3DrAuP1xYxecJlvhqk4n9Le14g
	 RXABeX1FF2Yr3s26ZD1K/Of2xDAW30C62STPkq9TMdfpMurbn2GgJR0HegsLR4Ak7rcb75qYctf6
	 zvk7LwOhcP+YAzXuIDMWx9obSN0PwJGObR4eBHo/Ww9JFWTuhwuZIHFnCGl+2eP951r+xn9+qVu+
	 as6/dq6/ZaMplTuatRxj9ZytVzHcGG9juDhtM8BCSLA4Y0AKEEpXtTcsiShDZHcgrMt0o88ctujq
	 /dD3Gxi80VjQfl4XVhtR+W3F+oYSRC5Dul4O7672KPIom7Pjtwd0ev42STmJ7QCn+LGcRfu/k+VT
	 WjkAYgjUFFMkCSGszQ05RTHbjCqM+ft9QDWT/0stfyjmsAYjNLve/iezLjuTDo6d5V8SdYg5UiM/
	 LmenzJJbPIGCZd/CwigiSGpso3Rd0R4pAPwGjhCxm99j8SLn8+NVF4TqKzsaVUOmq0Pgoisu5fgv
	 F2CIZNNlM1MebDUkXY5XDs+QKrbR5jIPWDmWObYXDbyJERonmSCGxR3ATF7qaaCfOF9SnxiDqhCy
	 GQwmiSPnnZbKtbgC9DWVm22bBsFN6eeWhHd4v6eo3Cv23msgZal6DoJyFYO6i+TFaGnTWMKENqfd
	 QyXzk8OR+zvAh1QzaZ2aA3fFnK6g+KgCwafs137WYaLgB02hBk/OqhrlksA6XPiQldvwBaWUiJC2
	 ij9KYE
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Wang Zihan <3772548978@qq.com>
To: loongarch@lists.linux.dev
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	2023002089@link.tyut.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Zihan <3772548978@qq.com>
Subject: [PATCH] Documentation: loongarch: Fix typo "eXtention" -> "Extension"
Date: Sat,  2 May 2026 19:19:12 +0800
X-OQ-MSGID: <20260502111912.143743-1-3772548978@qq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the spelling of SIMD Extension in Chinese documentation
(both Simplified and Traditional).

Signed-off-by: Wang Zihan <3772548978@qq.com>
---
 .../translations/zh_CN/arch/loongarch/introduction.rst        | 4 ++--
 .../translations/zh_TW/arch/loongarch/introduction.rst        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
index bf463c5a4..7cd88dfac 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/introduction.rst
@@ -79,8 +79,8 @@ LA64中每个寄存器为64位宽。 ``$r0`` 的内容总是固定为0，而其
 
 LoongArch现有两种向量扩展：
 
-- 128位向量扩展LSX（全称Loongson SIMD eXtention），
-- 256位向量扩展LASX（全称Loongson Advanced SIMD eXtention）。
+- 128位向量扩展LSX（全称Loongson SIMD Extension），
+- 256位向量扩展LASX（全称Loongson Advanced SIMD Extension）。
 
 LSX使用 ``$v0`` ~ ``$v31`` 向量寄存器，而LASX则使用 ``$x0`` ~ ``$x31`` 。
 
diff --git a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
index a5603f9b0..9e4a96f1a 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/introduction.rst
@@ -79,8 +79,8 @@ LA64中每個寄存器爲64位寬。 ``$r0`` 的內容總是固定爲0，而其
 
 LoongArch現有兩種向量擴展：
 
-- 128位向量擴展LSX（全稱Loongson SIMD eXtention），
-- 256位向量擴展LASX（全稱Loongson Advanced SIMD eXtention）。
+- 128位向量擴展LSX（全稱Loongson SIMD Extension），
+- 256位向量擴展LASX（全稱Loongson Advanced SIMD Extension）。
 
 LSX使用 ``$v0`` ~ ``$v31`` 向量寄存器，而LASX則使用 ``$x0`` ~ ``$x31`` 。
 
-- 
2.54.0

