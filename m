Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B25476688
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308842; cv=none; b=rT8Y2jeQ+QljUG5Ko5ANTTnIfESGbPaIdhmfzJ91kusCr3hJKdEL5rGlbbOZkwwAS0EiykQPEK8APQv1F0um/1CGiqfXMxI2RTnptvzT7GqqnqIqIDi6a7FBSyvaNSIYIZp1t7TOBdAg6CQVQ/OzHuFc8qvOScIqOIuBbCx8lrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308842; c=relaxed/simple;
	bh=wEz4ZgtyClYNkXkc982cJpCMLDOhGyTzlEE2gr9dDuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+yRaY05C78liLdHkKCwiuS7NzZ+qd/ai1uT8VkT1KUT0Z9D3HdxNNycIQ3uxFOg7OW6K7H61x3+x3yZS4vC9s7Jx0ISrjB/3nfV3jBPOzfyjhCxyH6tglad+tVB8ThYDBBWpoaU8yD4cFiF/N3I4rRlW0pz2IhJzD9LbSIeDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q409Wl9O; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q409Wl9O"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so690919a91.0
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787308831; x=1787913631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a84/CZYxm09NelBeAscuCZNpIQOvpqYpxGXt6sid6wA=;
        b=Q409Wl9O/N9t/YO9v+dzqI4APpHo+6zHNa11bgSlYp5Ok/7FdI3+XX3unPJZEoRshU
         kR/9PPzmU4XcyBNXCRWQIgEnT4iKvVuMiHGeLICWT9Xi+4Jy2E/pNf/ophSZMhRn3HxH
         wQXSnxQbBescS+4t6FVCJtsN/FdCUasRL+ybW3rpc/XXfH69JjtmuBUBFB60j6skQL+f
         vSoe0Gny3iu3DL024g2FeROON3zwT7hNOWqkO+y4p7uLuBuw5Ede1EUcXA5LuVuOJ0nv
         tK5DbWlQRoezcvh2F1rQkM9YgOwlS95Op0Of0BaKhEOjYwcxEm+b/CGxDq3EQAZxo7D9
         E6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308831; x=1787913631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a84/CZYxm09NelBeAscuCZNpIQOvpqYpxGXt6sid6wA=;
        b=XbH8G/BjTNyLD7py6KGr7UDssjIb8Qj/CAi7W7DhWaCVNBz0qOuFdspDLnw99TIPRJ
         pYyfqOjovqbRFEoyFhrekCB/H0Uy62Dg/Fe6qrt7+GLpcD1QJ9Jd3Ra/i1K4qPhh/xVR
         A4kfmZBeWLYazK3wV65xWvrp/WQgdm/oJe9RvFYNBEcJX+3KPpaXpmqoIo4mGqS38u9Y
         CX4EtFGjG8gpA4S8DWCKEKMqjUsjRzY6AJ0Wy2Y5A96F1lyQ5gqMmkKyjl8Hw/qHCYI+
         1ZcQOkTH2ElIMsOc9HgQKvEN2hqBye5g9WS8Z/qOSOlG+aIq2i/LxUeBARYiBob8D1/4
         a+yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvzToLimmYN1VoIqqWrjDkH6EaDAdk/2eY794eGuZTWfKJ+VqUgmKWbc141p9RYSDvQZ1IFY7IiE0=@lists.linux.dev
X-Gm-Message-State: AFuF++kuoRkn8sc/h99wXm0B7Ax3gojRivsYQFI+Fs97pBbQNKMURyjo
	GL0ipfw2a42izqMUPCuu4NWoJZum08oC/t3CTrP5dnZ4LgzGmO3Wpl7X
X-Gm-Gg: AR+sD1365ej5NyKWrcjQ5WhcELZssETQyYH1zsVG+0MqbmTC//ELTQrg+zBVU98DHez
	Mvh+W5dCJccrJTZRtbKuXZXxl3pmibsezwwm6VG2a3/5x3JpEsRDud7kg+rnZXy3oJGOlh5zzDD
	Ht9TU5Bd5WJUgJBFhpWWwAUnFu4SzvWDf0+Wi+C8+DLBE301e0bImelm2CpChv8p7TuryRvp+Xg
	IrWRo1YbpygI4S+3R0I5eCwQTGfQOVO5ExBNkTl9t7+mjc0gvprsmL5LdNRhnQUVlMYJjb7tvDW
	DRVWnGRKEPCodDuTFM/wHxCSpovhGSv5hoFcUkxXKE45wyhhsYc2j8vN0zIc0Vtx5fVyyX/AwJe
	zBXh1cvqnx/FMfTwSWObAySdCyGCrtA4zpWeQISLN+NLB4nDSfBEozxl18c5GlMFy1tMhe9vXsU
	7ng1j/xC67dGeeETRid+vg9AzLS0jJ3ogyVw9HnQDovIFNxl/LTV6lgAkwBgpaQopLgNfe/Lejm
	yKC1Us=
X-Received: by 2002:a17:90b:528f:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-395c35636acmr10522154a91.7.1787308831084;
        Fri, 21 Aug 2026 03:40:31 -0700 (PDT)
Received: from localhost.localdomain ([2408:8409:1900:2232:accf:ab29:4a32:29f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c18fa7sm2875406a91.14.2026.08.21.03.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:40:30 -0700 (PDT)
From: Li Fangxu <lifangxu22@gmail.com>
To: r@hev.cc
Cc: acme@kernel.org,
	chenhuacai@loongson.cn,
	git@xen0n.name,
	lifangxu22@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	loongarch@lists.linux.dev,
	mingo@redhat.com,
	namhyung@kernel.org,
	peterz@infradead.org
Subject: Re: [PATCH] perf build: Add rust target flag for loongarch cross compile
Date: Fri, 21 Aug 2026 18:38:30 +0800
Message-ID: <20260821103830.2232-1-lifangxu22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHirt9gpik6SuGSri9yaOhBbuitDeyXrekpQ5=vbN2u-_aSKfg@mail.gmail.com>
References: <CAHirt9gpik6SuGSri9yaOhBbuitDeyXrekpQ5=vbN2u-_aSKfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for pointing that out, Rui. 

Please disregard my submission.

Best,
Fangxu
