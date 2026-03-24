Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4973E3BC68D
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334128; cv=none; b=o/yQ4jPon2sgaVdcsjudQ/2WgENeHR7Je0OHEhOKNs0O4PN0H5aNfNuuLwbOgTuBTumzglRdCbpRZGovEx9TbCMnqSinGPSlG+mCSw0TtYnR1DzvuWQDO1umXfLaDnvV/5ea2FuHAWrpaxaMpslK1uQHAorlG6htrVO0ThUkIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334128; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrQydtVy2q+5SDbJwLfEFA4agvZp6IfKlXDqEFeL9lCV5zjQcbQ49L1L/atuw2zsH4SUv/xjVs/zn17CtPTTlzhJAF9ux0IfLrbOjKm5aKDAc/b5Nj7iYtv02nqxvbVZd9jeShYp48Y7cseW7D8iGIsXzo/9aSVfZfj/50l7VZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw2lHpmh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw2lHpmh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so712464f8f.3
        for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334125; x=1774938925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=mw2lHpmhaFKuUjF3Rw/PSoa/sEvd0ljnp9oethCXVACFv4Y8SXVpmM452LMhiyYe6Y
         r+pamaee5yJdGLtMHw3WcK+cIdIIzU4c3MRXt5ZDlzUq6QVq5pJAGxWIHYKqao17a9EL
         vGalsfM5mi1oJvvD0TjRnytM4BFXWHX3FUXm862bfbP6+aEcOIH8OccJqs+MQIeLH7gj
         OPRwZn3q8ajNKCL8NLIvB9m62OtHuCa8wqQ9ZXVEy+zCesT5xgF5epUpXYpTIRqapkTL
         1b6n+CGfvdUWPRlHBQ3iLykfCEzyMXx74aJYdUwbzpxNoEVnSKcK4BoAz6uKlcZHCi2+
         MYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334125; x=1774938925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=VJ/GCHNSNDBCjcMz6EsHeXZE90iHs3vua+dvJVL6a9oGxWHRAlMDvI/x5NVa7RlXoO
         1FdBniOn9isJqGdS+uHJmcc1R0nJ/ixsuy3e3o24XHsm72zM/BGDPkpPUuxEUI1w4qcG
         J0PKPxFbODSngHR6cyPwrJNAsqcNrj4OvWIkqNuZexzTUhXkuUjeEcEIDlsvMIzKC9JM
         B/OZT0jdithpX5EYRzPxRvMHRcseM8jK4OTZUtFDiHmDmcYlvj4KMDXZzc/nQ552fagQ
         JvN0IclP0pAz2424X6lq6oroD8xro46Qd8j1g4CmP1/X31tNkhMoGTYAROcRR+nf0cQo
         54TA==
X-Forwarded-Encrypted: i=1; AJvYcCW4qLdEvHxo+ajjRekOMu3ddSB01UnWIAiAMA9yycgn6v16IHbZqaxhCsIlsjwQfecTjFQGmaD7IrE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfep9LM8zG6o6zVXrUX2wDupe3MdHPRNfXuZOrz6ZvLMR0remZ
	am9mw9m6UaEV0VjJiuJZ6JAAjLOIwyMN4l9YUzxPrvEcCsFNrzsr54xL
X-Gm-Gg: ATEYQzzaf/OTXfQ5zJT15IZ82Y2uF1lqjsbHHe1SquC8dIwkAgvNQKqJr+4+dw6p6eT
	5WnSZsMJS7akzz+YBIyZ5s8ELtQNWBFVl+OcxO5MCqsjM449eigTeD4fO7Sy18rGQVGHpjAycQ3
	b6n600D4PZCwUEOY1qdPa1jzLQZEQxkK1x1Gl0za2a1XeZqvH7zRcOIe0G6UhRg3A/R0IV9LYEI
	hksOiksMamN4y+0o2rmv4rDnW2y9278XHtwwYa8eeyHXxFIFivhf3LVnLOUFp47LY8O5ghC9LAN
	0h6KSTbXh8K8Zdoybb+7Kl8LQGsViDP9j0FP+ljLFFV4/7TgFpxjk4WqwDzzsgmJq6Wd71hyKdv
	Nh2h9fPjzdpUnbMeSaCcoNKKWKSZkiV3MB5LbDgrn3dwe02Wm6e/AQMeAwYlgnrPEYqVgXup/l4
	ponEoe4knC/ev/euMdUW0=
X-Received: by 2002:a05:6000:1aca:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b6423fabamr24225594f8f.14.1774334124571;
        Mon, 23 Mar 2026 23:35:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470380asm34457509f8f.24.2026.03.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:35:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ruanjinjie@huawei.com
Cc: devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Mar 2026 09:35:18 +0300
Message-ID: <20260324063519.3258161-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin
