Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE1B256C8B
	for <loongarch@lists.linux.dev>; Fri,  6 Mar 2026 06:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772779283; cv=none; b=G46qqcab74SrDGrfl1vx9AkxFs+mMRB9MaWmMn5YvLAw+UbX/bPaUA1ukfT53xOQ2iNecwJiCL+nSXIleeQiIEiW4KGitrHb37/zLCizbgFAGIImP2M5EI+RWIMlhvyQWS05XvncySoWKVptYaqwNlBVclFupByZvioZCX1ovlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772779283; c=relaxed/simple;
	bh=I1/cm5LttFDd0g4Y4v3qyD1slgVyu6rpnomFiYRE5Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvmbunuW8rOmRUdnKrAP2JfyN5Aa+1nFTlvAZG5JgMw9SfYfzjv6qHoUS+9H29vlZJDQ6YkS7I95/7nZcf0Q5KieW+jGJ3rV1Ye5viGxDMCtigrEGqvyrXb3nlpQM5c+xZWgqjsxp1OWBOEDapkdNEy1QoKlgCSq7kM/EK81fFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=EYXZTqkQ; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="EYXZTqkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1772779270;
	bh=V06FD4fP1WIlRIby4zy56+KfUfGL0hLt7tHMLgURozw=;
	h=From:To:Cc:Subject:Date:From;
	b=EYXZTqkQ5bGe3BLEovkWeLcFXBJylZBTXxIoFlcObKjm2bH8K8Z6bwPOs1PrcxsRm
	 nmqmshBlbjNztWfkduw1/73BvZh2sOK+BkZWh2OpVSOK7/v8JHMMJSgiz/TouwRp9H
	 KP7vSdjMzEiBFIkgLRk6UQfRbNFbFDzCq4eBNtCg=
Received: from stargazer (unknown [IPv6:2409:8a4c:e11:4510:818c:b334:624:49f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 81F801A3F28;
	Fri,  6 Mar 2026 01:41:01 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Alex Hung <alex.hung@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Zixing Liu <liushuyu@aosc.io>,
	Ard Biesheuvel <ardb@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	LiarOnce <liaronce@hotmail.com>,
	stable@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alvin Lee <alvin.lee2@amd.com>,
	Dillon Varone <Dillon.Varone@amd.com>,
	Ray Wu <ray.wu@amd.com>,
	Kees Cook <kees@kernel.org>,
	Yan Li <yan.li@amd.com>,
	Ryan Seto <ryanseto@amd.com>,
	Saaem Rizvi <SyedSaaem.Rizvi@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Wrap dcn32_override_min_req_memclk() in DC_FP_{START,END}
Date: Fri,  6 Mar 2026 14:28:03 +0800
Message-ID: <20260306062805.1464383-2-xry111@xry111.site>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Why]
The dcn32_override_min_req_memclk function is in dcn32_fpu.c, which is
compiled with CC_FLAGS_FPU into FP instructions.  So when we call it we
must use DC_FP_{START,END} to save and restore the FP context, and
prepare the FP unit on architectures like LoongArch where the FP unit
isn't always on.

Reported-by: LiarOnce <liaronce@hotmail.com>
Fixes: ee7be8f3de1c ("drm/amd/display: Limit DCN32 8 channel or less parts to DPM1 for FPO")
Cc: stable@vger.kernel.org
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 7ebb7d1193af..c7fd604024d6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1785,7 +1785,10 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, enum dc_valid
 
 	dc->res_pool->funcs->calculate_wm_and_dlg(dc, context, pipes, pipe_cnt, vlevel);
 
+	DC_FP_START();
 	dcn32_override_min_req_memclk(dc, context);
+	DC_FP_END();
+
 	dcn32_override_min_req_dcfclk(dc, context);
 
 	BW_VAL_TRACE_END_WATERMARKS();
-- 
2.53.0

