Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BC1095B
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719313244; cv=none; b=c4/ZPk1u98lSQNAJcqgQ1bN7IYgqJV1SR0OJGVAf9mf9Z8OD6icuIM/qWhQL/zGtJMrVPYO7H9ap8PBSVIciel90CeZ8xX7Z9pDMcdix5jXi7l2tBGt4HIb2PLeAF88CWQ4eRQ3J0si0J5I6NsJxBse4wL7OO0a9xA2nXIbER1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719313244; c=relaxed/simple;
	bh=LXxICpUjmWmSc4J6mlziHyd4loNHPBkcM3DAZ9CF3KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcXsAt7fuyHyAOWuL8OkP2+gKZFQoB8SrN/j/S4tjcfzeOnofwj/95DY4cYYbfs0FWPPHha3wVaULciD3btDj9fvKpeTF96Nhod8b/nxfOwv4izwSQmoRiaUul7RaYWJvc26KcZjIC14c9sbFVDisyyUnWHDffRFMkAoPqHMPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKHzgCYh; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKHzgCYh"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee83so5711768a12.2
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 04:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719313241; x=1719918041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGuMtnuYMDiDL1yEpiDAlqtm0FKjMnUCgN+mY3AbRvI=;
        b=VKHzgCYhX2VEDlrsrZQaxMJqgRo3zlB6XL4iVG3TcZL++GuDfW0zc5fAaJ2is1v0LY
         8ar+zjn3VpNdbDZX5q0HaSAr4M7PkxS7cnIH/n6mhT56Ke7KtuUTYARU0H6sEWuzcnOG
         JUW7OrPhT80SCQfzF01Lw+PRZfKcG7xhmYKB3Do32GrXyqzjdYGKH0adKxjVGes30OVz
         6DBjJa/knP275qxh51ppuKNgyPtwc0qSWgn4Qc5pqeSNRutxojLCoKfjmbydBpkL1fkj
         wDTVVBtSW0wy63wPf1f9GTW5kUSX0UBTbdTZ4T9X4oisBiCEgbaOP8v+98EtKTyv8W6C
         VX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719313241; x=1719918041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGuMtnuYMDiDL1yEpiDAlqtm0FKjMnUCgN+mY3AbRvI=;
        b=tByDwSbbHdEcwSgLg+y17mDOjsfhqk7REuc3PsIcf+A70YcqlfGe6Dhy97NaIMWpeY
         S4igp0PLBilQWGqz+4nNB4UlGNXnqmBPa1qNOUz1NohdfYSUVKcnRZiyZ/5NdLvMZ6jZ
         G0jgsjhHiySXXg9IEmt5uODb0E+Ab8+vlIyPo5/Kwos7njozoi5/UOMnJ+Fq2h6RfGRD
         60mticAWYUIUqIvE6guK0VdzBM7UD/QhOgLXzpfnbys1KZbAYWLuVvfqdR8DNJMK2grj
         Qm0QsiMdTCi0gLuoteItYx8a1VMuvy6Bli5+Cx3yVimR+nUAraNi7hkWdB1n87tfELir
         9i5g==
X-Forwarded-Encrypted: i=1; AJvYcCVKTzqaM4x2GK6Y4FOE/6yfgbuEGyhqpcT800xyfoAN4h/LNJsE5IpCP+KCsPciHRAylxbGz5rarD42pUEj8SzQzeAe8KSw1PML
X-Gm-Message-State: AOJu0YwPORJZpq0tsnnOJw1LfTFBUt7Wqz6a1yhvmaJ3AHS4Pyh/cKx2
	WKd8CpzBntyquzWK5GJuGLgata2JNHVZRiH77GZTqef0kzX4r6kT
X-Google-Smtp-Source: AGHT+IFxDd53h1WFg33yA0zukb1pOePy995Sl8FyyEAE1kDCnsUuiOt6rCItKjhRfWIcvsXG+WOfpA==
X-Received: by 2002:a17:906:eb09:b0:a6f:c886:b68b with SMTP id a640c23a62f3a-a715f9799e0mr431429666b.43.1719313240713;
        Tue, 25 Jun 2024 04:00:40 -0700 (PDT)
Received: from f.. (cst-prg-81-171.cust.vodafone.cz. [46.135.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724162f037sm337272566b.194.2024.06.25.04.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:00:39 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	axboe@kernel.dk,
	torvalds@linux-foundation.org,
	xry111@xry111.site,
	loongarch@lists.linux.dev,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 0/2] statx NULL path support
Date: Tue, 25 Jun 2024 13:00:26 +0200
Message-ID: <20240625110029.606032-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generated against vfs/vfs.empty.path, uses the new vfs_empty_path
helper.

I had to revert "xattr: handle AT_EMPTY_PATH correctly" locally due to
compilation errors.

io_uring is only-compile tested at the moment, perhaps the author
(cc'ed) has a handy testcase for statx.

Note rebasing this against newer fs branches will result in a trivial
merge conflict due to later removed argument from getname_flags.

Mateusz Guzik (2):
  vfs: add CLASS fd_raw
  vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)

 fs/internal.h        |  2 +
 fs/stat.c            | 90 ++++++++++++++++++++++++++++++++------------
 include/linux/file.h |  1 +
 io_uring/statx.c     | 23 ++++++-----
 4 files changed, 81 insertions(+), 35 deletions(-)

-- 
2.43.0

