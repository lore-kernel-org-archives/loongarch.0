Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708047125F
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145374; cv=none; b=blee+QKE7MEW+43fcQSDaXn7222La9Tjk5tp8PjbXEkdFM93s2B8P2aDteRuDh0WRhuWskXQChMYo/k2UTh9Jjr9TLCjPEgAziYhR6pj183Q1vYio6EouIWNUsySXeLzEAH1pDIQHjHTzvlVcKR46OyI5/3YGax0fFFq0IVYX08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145374; c=relaxed/simple;
	bh=y462Q+q8oUQGg7quqBwcm1RU1wGDkgobl8Os4e6L+To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kU6f1T001Frq6s8yQ2AteYzjeSe0Ektxhri9LCd6Bl3zxs0OS7dGoDSKeuMA8NIw9rdANjlRISrY6k+2DjI7ro7C9oGWRwDdZRaxBs/h6Ou4uYblJKPLo7WyVLW/ZH5KaVUw6xzmSP90rL0a5ydg9lCtx3FC2i+cWSMwSjIVMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZBssRs5k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZBssRs5k"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e011d370dso271308f8f.0
        for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792145370; x=1792750170; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfjtBumDUQtQeiNse/0/IpCKbiv0enjynpJ+UPte5LQ=;
        b=ZBssRs5k+y9K5pOQACoKASl/esvxUdO5LPFfik9FgXZXHrLhM834yQjLsAAZLWM5vW
         KzssPkpL/wWBjKsOXHiswjw0WF94hbxXEHcMmFdaRJtpjxdwvPHgcolkJSK1Uw7/vQ2B
         3NsMxTF4kW+O5bz8DBy78rVazLef0kr0MuyOiId+v3oHGmQ15w5KhH8VldD0y5T+nlkw
         JYVqi3WwpaAYAa7/f3T/H+QbpsU8ssE4+7UtOQA3E+KW+PcwxjAx5SR8UfJEVNcdSXdM
         njCcD0RF0YwHQjG/ediNeX7r2hfv0wy5PTi6fR+tB6OvQJBldFgj/O1Ft2NRlsYiR+Ca
         cpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145370; x=1792750170;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfjtBumDUQtQeiNse/0/IpCKbiv0enjynpJ+UPte5LQ=;
        b=HoiCr2yd6f/kLc0BK+LbTZS3hPop2wnfbstjcirB4LZ/xdk1P+3Ufv/p4jksaz4AZl
         bwps5hTUdkx92EGq8cAaufX957Gqq//gIwEM8+3IczWfj/QMKhpggCQudP6VXmrnqBMr
         dEXF0RjQnIAt0hlBpaeqOA9wbMZHeQGmyOkNCdnUdG0SouUu2+DVctfeJZfPoMxeiXB0
         F2FXpAenQpf9GSWhUpkAcEw47wIVbeNygWnxbhkXYQ8UjwRZpNJQnFPTunwOOqgkshKK
         bZp6Z8loyHJuT7pMek1naOmRIt0DYdVAgNW2NtLxKLuhJuOebOMzlUpBZZ6Ysw3UJofC
         2DLw==
X-Forwarded-Encrypted: i=1; AKwUvBxObbqYdvnNy+NJROIfGmx7wcNKbk2Q9bW4WcUkzFAqPP1QukWdZsiXmfBRNTDi6mf6w5qJK0aTKyo=@lists.linux.dev
X-Gm-Message-State: AFq9FYI53u+pouuo7cHeahJYTg21UnG/RxZHz84h0zJlWceh7MIHO1za
	mpe4kQdSK6baUCaEMzr4Tm+oMZ8tQCTWmTL9j3XJPoYsuEymKzqzRfBxIOB3/QmZl3I=
X-Gm-Gg: AYBFou2FBL5n8lgxHsYgSsvkwXc0nJ9wwuR4YRvKW0X/Pposhznjk7QZ8TT0TzdBRq6
	CugbY8cM1skI4KOPOX2qlufwl7vokN3gv0TnU9u0TM6DsE26IheaStmGNRvNDsOWrxVCBdEVf90
	Hd088Bv1UryGNx3XVMxhLh+xjU7qM7Jh7Yug4zm8pLnrSszKQkoTbG1X+X6jbDUwPP47Fc2Mub1
	M5MXyj1PfWmGOMlb8VFlbuUB4R3nX5TFFA14deKD9rz9hq4MRkk8YIv+H6OJdvZnQP93tRWrc1f
	hCDruO/0Xp4cmuWNDOod5+K6R6eXgnTC5XlOdzouqR0rA6gbu4Q27qZNJOQYDO+UgyIy5dm7AqZ
	QPM4YVkL+x5KN+SjOmkbnMv6t8tpz+LPwALEY2qvsc4klCZ0tqcVRlzv3Yc8vkZWsnrF/F4NEFc
	R3Fz0g0jSjGF+XVYLXqnN+pP0XsLjYLJcpqWrZc1drZkGIKFppBy53Khr5ti2Am5gwwzrUkMxa4
	Ilkdalk00zkd3iKz+g1DZVS6s8ddcwojYoh1kozTeTMJIB2VCmtST+4I/pW
X-Received: by 2002:a05:6000:29c3:b0:488:764c:7a17 with SMTP id ffacd0b85a97d-48dba788922mr30073917f8f.1.1792145369626;
        Fri, 16 Oct 2026 03:09:29 -0700 (PDT)
Received: from localhost (p200300f65f19a904af4079c70d984f00.dip0.t-ipconnect.de. [2003:f6:5f19:a904:af40:79c7:d98:4f00])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd4f5b2dsm4364872f8f.31.2026.10.16.03.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:09:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Nicolas Schier <nsc@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raag Jadav <raag.jadav@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/3] <linux/mod_devicetable.h> deprecation continues
Date: Fri, 16 Oct 2026 12:09:11 +0200
Message-ID: <cover.1792144769.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=y462Q+q8oUQGg7quqBwcm1RU1wGDkgobl8Os4e6L+To=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq0ffICy4QAVwGpwrBpebGe+cZKb2jzXNv49Mrv E/fwiNK8BKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCatH3yAAKCRCPgPtYfRL+ TmUoCACZSyCbbUDkUav9mU2UDRAssLukMQD6BaQ+B0KWo8b1Xz6YWELM2d76YyJo0NYic+F2ULL eItz6V6UkKv90SFZJdF9DN9xNqeLnGUdIGls3IPrNHwakGv673gnGajgixnjiMwscDru7+CCOvW GN59gUKywNo1HSVHKDQzbDvbzjRa5LNV6mUeEHUbUxo8HXf4OOBHqEi+yb7Caef8le+sulMswAu 9n7jAyMVSDnbIYj3OFhgVTpM3NlDGMR/l4Xg2TKJatULMGjgmV/Agq+HMoY5U6TUyRlMA4NoTnh Sx0oy1ru/ntYsxCLrQ0zcQUC0N23LmKi0EVB8Bce9/KOgCwi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

v1 of this series is available from
https://lore.kernel.org/lkml/cover.1789988540.git.u.kleine-koenig@baylibre.com/

Changes since then are:

 - rebase to v7.3-rc7
 - Add a header guard and a comment about why it's necessary
 - Add Acked-by: for Armin Wolf

Nathan identified two merge conflicts for v1 with commits in next. These
still happen and are easy to resolve as soon as the respective branches
are merged into a common tree.

Nathan already proposed to take this series via the Kbuild tree after
letting it cook in next after the upcomming merge window closes.

Uwe Kleine-König (The Capable Hub) (3):
  Move struct cpu_feature to <linux/cpufeature.h>
  devicetable-offsets: Include the needed device-id headers instead of
    the catch-all
  file2alias: Include the needed device-id headers instead of the
    catch-all

Best regards
Uwe

 arch/loongarch/kvm/main.c         |  2 +-
 include/linux/cpufeature.h        | 19 ++++++++++-
 include/linux/mod_devicetable.h   | 13 -------
 scripts/mod/devicetable-offsets.c | 57 ++++++++++++++++++++++++++++++-
 scripts/mod/file2alias.c          | 56 +++++++++++++++++++++++++++++-
 5 files changed, 130 insertions(+), 17 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0.rc1

