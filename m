Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC63DCDA9
	for <loongarch@lists.linux.dev>; Sat, 10 Oct 2026 06:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613257; cv=none; b=o6Yc/458SUozcViFOjKQwvrLPPGa9T0QUrMQ+sx77WDmJRoeewida/0zXkslRpV0G8defAevoUBUXqt0rHUzuPAiePCw9HyDIUBCBLZLGbywLi9aou7nwMBJObtLYg2nuhTEgg/SdJYyNgu3DlU9k28LuoPpSdO7bRDtd6ODQgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613257; c=relaxed/simple;
	bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avuICXgdLIFgbhX85yuIvxmJPoYHv773Don2UcbBHbC1SYumuHwa9S4A5qAhuLitwpPMEdhj5kTNtVnhwsIcK03FQk9DZVn6kulQujuzhQ+yU/+ki68mJW3/2YJJcrfOkyHpDPPn3sTq0tY1Z38zczNAQ8tIkOtv3JQsIGczUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcD/ir4e; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcD/ir4e"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so179416a12.1
        for <loongarch@lists.linux.dev>; Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791613256; x=1792218056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=YcD/ir4euwlUX0ZMEWV4511/Z+b9Gq4b5yscVkJIXxPGY3dZVMBz7IHOYTq1pCibhU
         DyPLK4esrtt1y/DgVJSjGarNvlQ7km7hhKKuKvGO7Dx+r5gOfUOEg1YDeFr8TknPuzgP
         46eOD3eCnThfiWHEV0ZcENuuLExt4oPXgCDavLjlKrf0Mg/K7R2Ykra9MzRD82/bmhS7
         WmN0l4xdtWIffW2qUdgut0YFHMMX+RV/pfUD/C6QpP6kP0XHSlHYDmf72Rrlu5kjKxI0
         UzShoeLkJKa6d96uE20V3LKIyYyKdJBrLv+KYgf81xmAkO6URfVqkUawavWczPRn5+At
         naTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791613256; x=1792218056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tF57zidWZwWz8hIOotoZx9jwOMzu5EtZU1vKiJE6pKY=;
        b=t/KyHS8UM4AUTfBIlUWwk/nLoUiruS2Yk23Q+56i5r1qqAr5VjaxKUSBk96xWsnlOq
         XpGyQ0fQ3bfyGRJpH2NMbZM01JfdFYdh5S49jMFoEtHSJUq5oJuBYi52zq4pXuDUQ+sK
         O4QdYg6UJFAYbcmBZLezPxz4rOZ/BmyCTHIfa3KfNajFOf3UMVkSN2dvVIcHjumNGrNy
         q43gvMfntdCjJvL2tnyDBWbQCtp0DGU06lUCF/kb44JqCOOHbEWyOgx3T0wHCQWKzh7B
         eqBNXpcfIbl1xecC6xof26WZutzUIF/2CmGTwa5Op8yklo9FuNn8ie9S3divSPr3jtLk
         HiYg==
X-Forwarded-Encrypted: i=1; AKwUvBy3hOWw8TlHwzFnFCwfGmlW9apeBj13uN4Mexd1d8U2UJA70/2OQgvHF74fXCgH/6fiVDlScXhix70=@lists.linux.dev
X-Gm-Message-State: AFq9FYLBY7qCAXVv8mlR5E9AhJFqWmD74i2BbMn70LLOnjau4+p8p9A5
	fKIojHDGMkACKcUMeChdRWG13naAGdiEwoopDLJEE8enM1Bux0yySDa4
X-Gm-Gg: AYBFou0zyYkJAAsEXbL2aWQzdKC+GV/QkdugcTxmn2t/K/IiBJotaD7d3tgb1uqTGI6
	oAlGeuIPPvwC+JzQ4elwVDqi14niV5WWsYDN4rNDHKcTPnesQzyrXHQCKeIgpdXKFFigBUjSAen
	1HScb2IXSq2wUg9/AO/Z3xQvuI8qOnlHi98Bym9iL8TnWI2viEgrzFMrFqj1lDK1KF3O7dQ7URE
	ETxVmmhzCWGDGU2iAUDU+bflHcPTXnAbn47FQnFdRgZqLdw4HZYLYNosJXGm5TewPpQHkAbkbEe
	Y29dIhZh4kfk2oY4TEUmqXM3/6DDGE4iUTM8mRPCKYeZGuEMRJgeilwNqR+giR/gIhWFksV4xRp
	OQy+WSjQio/n5mNRObk2CrwKT9mMP2vyDA1jMcRuxr/jZRH4P6ALsON0vFf+dFmXeLeF5mtzj5G
	aySfd+lm+Zdqdd3FANCXvGuAqLSC3uf2TfrSqw9by/vKrFYVgtGo7BSyJwXu+XipIAWDXSmrxOR
	su2QpxNQGkIiV1/WLPzRup5SoX830CXdlifDPZUhvqhGTmDa9zna0HrB2JDmD9q4C20M10QEBkF
	QgK3j9ifIRShuILsM2Gjz6U=
X-Received: by 2002:a17:90b:4a90:b0:3a0:d79d:b6bf with SMTP id 98e67ed59e1d1-3ab3a90e590mr2805853a91.20.1791613256121;
        Fri, 09 Oct 2026 23:20:56 -0700 (PDT)
Received: from Inspiron5409 (61-228-80-139.dynamic-ip.hinet.net. [61.228.80.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm6418243a91.7.2026.10.09.23.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:20:55 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	chenhuacai@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	hkallweit1@gmail.com,
	kernel@xen0n.name,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	loongarch@lists.linux.dev,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH v19 0/13] ax88179_178a: Add support for AX88179A-based chips
Date: Sat, 10 Oct 2026 14:20:47 +0800
Message-ID: <20261010062047.399148-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

I tested the v19 series on my AX88179B adapter, rerunning all the
previously described tests.

The previously observed VLAN-filter failure did not reproduce, and no
carrier or RX failures were observed in the test. No confirmed driver
regressions were found in the tested scenarios.

Tested-by: Jianhui Xu <neuromoments@gmail.com>

Thanks,
Jianhui
