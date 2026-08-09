Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F919F121
	for <loongarch@lists.linux.dev>; Sun,  9 Aug 2026 03:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786244485; cv=pass; b=hrnu/9cw27ueg2dIolwN6WeJ7rfea1T4IW/fdaQBVKdLWKODA7ftyP2AJp0yDRn9FOHj60cz0xjI8JrQUJCT1ZZohfrK3fNpg7AdOMysiZk5wqhoSds1ia9kmgAXKctz1NwiUhY0UitRTqijjLROhB1qqnsO0Z6TDHZguvOWYXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786244485; c=relaxed/simple;
	bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOVktUa0yoTx8pLEi/H+CQxOEuVRsiM+2bJUEa0o0lj83EyMNEY3PA6G/9/StbLttQrjol8KgARI+MM+T5EGZ7VOquCqBIcAbdvykF4ES3Tpez+KI1zcaPn0j/qoHQu0rB1Rm54TeAFKpyRKf4vK+UkYwOLb3/vOyPdtlkTiC2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofXaZ1bf; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofXaZ1bf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad85b7b5aso800955ad.1
        for <loongarch@lists.linux.dev>; Sat, 08 Aug 2026 20:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786244483; cv=none;
        d=google.com; s=arc-20260327;
        b=XghGa+LFHH09NLuMvvVAIHLVakvCVL2uDg25Iweb6usYz20sfdGVtwHE3/mI2XQezM
         Uwr8DL1zHQ2PuO9LFgnm1hG79RBIJO5AQ6nFomi+y0Gq4aLpIZ7CuDvoAwuh/jUUjlWl
         hmhV/nT3ASzeiFaZaRM1gkER6VwUaYS8ZK5g2ejUlaSu8ixBx1RWtlqfoB7ACAd4jZlf
         4cYQf7HNchytOSTdiYnjW5SGedzsqrA6MfflJUR5GqoM0KawKVlEJyZ1hvsugNY4seT5
         9whsw2A3W21yIIs2S7akIcoZGcTFs26flloRPeKK2u+Y+UPBLTuVCXkwqazDIxBwqKoV
         cl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        fh=Efrru+0AhZ0iVgJ1B2/m9lV877Bn7rHJ9swxId6sgVQ=;
        b=Te7Rc7y6GxwocgPkdzP4zL2aTykjzJobWi5FSAQVTcYzBJzXGI6A8g6T8lOSd0T+e+
         RGPvCglGXa8uGCOJH/N6DkFipNDwA3SYJpLw5KPsaGRNA5C6gzcrTL9NmQWDlyOt3fpp
         zB5WYPW4fqlJaPVaQJ3hbjQQjys9Q+8fXw7yUie6SEr7GMKeG9QQM+XVx0P6aVQZALOX
         93KoXfGVI5BkRh+dU+j7GYplW9Q7gfob4Cucyqvkh0oMbAuondKbQu8xYrmrLt6tVMG8
         ct5tI/GKYJQHYG8EJ3NMArIgefNa+uC9I3UnTpamypPmaD0wsbexWzt56eyllYu+rWUt
         9xgg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786244483; x=1786849283; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=ofXaZ1bfdLDia17Jczj/1mzPTMDxi5iNRzBsCe4DPS1Ukh+yp6tilgo+BYb5PCkeve
         Ob6ueMC2IXa6KLP5ChwTBv6K/RkEZ90Tl+dMuPcwS5fr7q/jX2BGDph8DvHFhu6MLcbw
         lmlaH/YOrjD1+I1wtPCD4TgwSdkuLF3EaTqvWacnAi2d9GdmSnH18Dv1mpUDFY4p8h4t
         vZTKAc1Bnozeh7T6Q35TlHyPbLxhDkdy6h2X/tAUPYWraenkKc5aH3gv4lMFsPdDUwS0
         wPKd0+zLXO+wdYT9kf5kVD8K4CK6dUv4zvQmliM4v+cRVNeH0p4XUe5c4ee7DD10DhlN
         NEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786244483; x=1786849283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QssombK2y2bxkLpbfBWs6fhMLQY5cUQH/zTynZfaBI4=;
        b=dXoGeGPbehw++OjzXRU5nDsM8nvpG82y/sEFRYLsKfYdipolByCM0CNWtyu5yosbzY
         aEjd66LVQgSHVrivOsVdYGsNfFHES65mydLgpjHpo9ahi36ThXFukq2VGqPD+4Yxjtfz
         xKQNxHORQ2ooZCMW0dMgA/T6mM1o3Zfjez2bMYkC8bS04dYZqZa5Vez6PDC4qTE5mMia
         7/0UpulCGrUIDDmT0OOksGzkt7ZALo3YLy4gqtQsxs92BWBKj0/6oIawL54c7mnZA6sX
         bnhf+KAXHmxzbEaw20oN0TG7rlezkzVSPqulQmkHg45WOAT21EUWcAy9xogwUsmcwjqp
         ufqA==
X-Forwarded-Encrypted: i=1; AHgh+RrghBy1a/erz5/vC2k7xhaLeeyAjeebBCpr753KI/KwJZcfi7exDo+oHHlW0qPIWtOIAJB4h6WvuoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTNLAvZJM0GgFtUy7TNZVdD/XZWH+w+1/7TJYumeodUEhPQMaS
	ixjmJQi53T/5dgCuj0FDw7Pes/WEnzQ0uaewflhAzMisb/4UYEoFVKDBLYeGKZoMejyPOaRtI3p
	VgYLU88vCQOngD7Ob6Z9oJ0eWS6oNPfc=
X-Gm-Gg: AR+sD10b/eJA0hqBr04LPOWtWKpORNdnrhpqHvyZ69+/s/4ehh39zhuvrg6I8EV5P7/
	RpYSTC2aAb5ch2rsmFpSbb4B1rFhpakQ5jbXci4SUPs7iCioOtoheRXNcslZefslYBRlNl8ws+O
	khGY2mabJ2uwC18yD0UFUX5Q1wH7hJgGppOLaSeDDKu3hwm7Aq032cDvnHCtLGD7Z5HITB5aqTC
	sidqKQOVMJ1MclB32xIwyCbr0FKkGOsHqwCwpjEtL4d6ArJDXs9RGPLjcMCfUZndx8dFLgSso8m
	oAHfbwlmnmd5aBGbwBrQwtahqe+ZgG17H87XMvddCpBqodZJ/q1YShmmRSd2vNbRmP6nKSO8D7E
	AF3rBTIQYSvSblGQG31tOqmJ6+Ju3BZo9HY0N7OHhVJj6hXK8ToNaCdc+UgZy
X-Received: by 2002:a17:903:17cd:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d0ca7b0285mr257513645ad.1.1786244483476; Sat, 08 Aug 2026
 20:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
 <20260808.143013.1251068388254615351.tomo@flapping.org> <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
 <20260809.095041.602618436881623934.tomo@flapping.org>
In-Reply-To: <20260809.095041.602618436881623934.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Aug 2026 05:01:09 +0200
X-Gm-Features: AUfX_mxOkJgVjfpd9Xjn2_lEgaaMyCa2CI5K0zvJDPjtb_T8ut0EX3_Stxulh1A
Message-ID: <CANiq72nxE05HEyNmxGj2gYHaYL95eQQVF9SAuhDdHX0RDW1i2w@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 2:50=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Then `jump_label.rs` needs the same treatment?
>
> `arch_static_branch!` embeds the generated arch asm too. It is not a
> problem today only because, like `warn_on!` until now, it has no user
> inside the `kernel` crate itself.

Yeah, I think we should do it to avoid surprises later.

Good eyes!

Cheers,
Miguel
