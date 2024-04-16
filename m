Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB518526E;
	Tue, 16 Apr 2024 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713263277; cv=none; b=X0ZGrYxQmYWhwjWsOthLazasU4tctJ+an6nvMD9IFoc03zMxcXTFt4ZlLQmopsD5902oa5WUoNK04O6WMfGsZPUnh3R7GUajXWKGQhGamYtAs+XzZHOyevtGNDlgLmof9eKmPB7mdI6NoXJFr0LKuGF9VIzARoXOO+X7w09eYV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713263277; c=relaxed/simple;
	bh=MLsdr7kD3zzTJKBErjYyRBFMSvmh3TMK8QeAykYBK+I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=q58BC4AlkQdUqwbJNAblpCud9U0MKroe96GsMlt0PUcbnp7e4PLtedw0XgMyLNCniFL6gs0TfIgU4V+0Ih/LUOeWSbQy1eXEY9sZfHjYRBmb3cjq9S+r73+yRykwuhE4fz5vFobyRs3QZmKMQqq7dCR7mI4fv0ByGucoEhPI49s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkOifWpO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkOifWpO"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso3187791a12.2;
        Tue, 16 Apr 2024 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713263275; x=1713868075; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/cIoa81DXO6MS6g+ZMtYagosHO4PwrAmNMYS0AM8V8c=;
        b=nkOifWpOVhuNgrOfRyluUtWBBFnG1Sv/M4W0EiBzZ6vWAbCoU/FUcW2ZoFL+fNdbra
         UWvdy1bCLie4LFy/ZI4+F1IbF/hRNDyris52FH8TqwSkjOktVPY51V05HMw0i7xl1LyT
         H9qVG7NEEz9NxgeBOh15lUkGna/EnSwRQAx/YwASOEOqPVqA/gDtvsnzmS/QzVYqUVNI
         3MN05qSZ3ChsegSy713wOhU8pPBERBS3OwK9uJAry/m4OLOta89+D+33mcc1+FZiaqSW
         eUWeKavQOd3eEpEkj7mT2dsuQC3E5df2h33fuLbnbsa6Q+4kkHqsT39U43SdusuDWKe/
         yW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263275; x=1713868075;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/cIoa81DXO6MS6g+ZMtYagosHO4PwrAmNMYS0AM8V8c=;
        b=G/C08gYlu4UD5jLvCxV7kIWRiNi8TJsKL9jFC5FrWA30MeqmPEEerqfvL5RLY6N6fu
         n3MSlYeu6/Or2B5YCTXdJdw9j1bu3ksYd4OWSb+QrG09q1HAgWfoE6eggXUBlUg0GKdf
         5c5siG+eHyik/Gj0rX83qUyy4vwv8B0dbQWrODnS7Zv4FVil28XfPUsNMG3FgiTHkZtd
         ab3JY4n8dCgksYTOZG9A0pqkj142t0/dvSlE/qy8nxFCEJK4hLvL8dLY7bDIK3HpKU1V
         Mo/smqvlaKMz1aYl38K1VuCTNLopAg0JgCX1XqKM+B64q+o5H28FQ8/7CkgVOyOla6D4
         5iOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa2cBZyo0s9GzckoIvqI0OBgtx0Tl3fm5mTH85ynsBM48fmIDWOrrcrTWPnTGpZt5C+Rwo719EZi6BScEiL8Xg1QiO633IafM2Bw2bRUTdrXycsC6lEvOiIEWYuPXH1Q==
X-Gm-Message-State: AOJu0Yx5lPYgRzQd3X43z+If7b+m2cLbaA96BxceuMTSblGX0haugW0W
	AJNjIEnauBO0eaoYe7sy1apGUF35l8AVn9hC/FsdI9R2RA6XM8n1MvbPYvpShiEgnmQgaY7qaoT
	eSWnjRVezxN/KhRTXMiuzXy5T/5I=
X-Google-Smtp-Source: AGHT+IEQCW1Umn5/jxfj5DsIuaZ2+exXuJmvDw88NBcTFIdc6HQg6SZiheR6MqEF6Ri8xe0SbEpGiX0n8YxTyu0/8v4=
X-Received: by 2002:a17:90a:8b05:b0:2a7:40ba:48bc with SMTP id
 y5-20020a17090a8b0500b002a740ba48bcmr10112056pjn.6.1713263275084; Tue, 16 Apr
 2024 03:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Apr 2024 12:26:57 +0200
Message-ID: <CANiq72mQh3O9S4umbvrKBgMMorty48UMwS01U22FR0mRyd3cyQ@mail.gmail.com>
Subject: ./include/asm-generic/tlb.h:629:10: error: parameter 'ptep' set but
 not used
To: david@redhat.com, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, loongarch@lists.linux.dev, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi David, Arnd, LoongArch,

In a linux-next defconfig LLVM=1 build today I got:

    ./include/asm-generic/tlb.h:629:10: error: parameter 'ptep' set
but not used [-Werror,-Wunused-but-set-parameter]
      629 |                 pte_t *ptep, unsigned int nr, unsigned long address)
          |                        ^

Indeed, in loongarch, `__tlb_remove_tlb_entry` does not do anything.
This seems the same that Arnd reported for arm64:

    https://lore.kernel.org/all/20240221154549.2026073-1-arnd@kernel.org/

So perhaps the loongarch's one should also be changed into an static inline?

I hope that helps!

Cheers,
Miguel
